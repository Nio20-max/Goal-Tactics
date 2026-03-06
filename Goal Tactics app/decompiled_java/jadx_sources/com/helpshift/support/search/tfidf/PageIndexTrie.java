package com.helpshift.support.search.tfidf;

import android.util.Pair;
import android.util.SparseArray;
import com.helpshift.support.HSSearch;
import com.helpshift.support.search.SearchTokenDao;
import com.helpshift.support.search.SearchTokenDto;
import com.helpshift.support.search.storage.SearchTokenDaoImpl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class PageIndexTrie {
    private static final int BATCH_SIZE = 1000;
    private static final int MAX_TOKEN_SIZE = 50;
    private static final int maxNGramLength = 10;
    private static final int minNGramLength = 1;
    private SearchTokenDao searchTokenDao;
    private final int totalDocCount;
    private PageIndexTrieNode root = new PageIndexTrieNode(0);
    private List<SearchTokenDto> searchTokenList = new ArrayList();

    public PageIndexTrie(int i) {
        this.totalDocCount = i;
    }

    public void insert(String str, int i, int i2) {
        if (str == null || 50 < str.length()) {
            return;
        }
        int length = str.length();
        PageIndexTrieNode pageIndexTrieNode = this.root;
        for (int i3 = 0; i3 < length; i3++) {
            char cCharAt = str.charAt(i3);
            PageIndexTrieNode child = pageIndexTrieNode.getChild(cCharAt);
            if (child == null) {
                child = new PageIndexTrieNode(cCharAt);
                pageIndexTrieNode.addChild(child);
            }
            pageIndexTrieNode = child;
            if (i != 50 && i3 > 1 && i3 < 10 && i3 + 1 != length) {
                pageIndexTrieNode.isWordEnd = true;
                pageIndexTrieNode.addFrequency(i2, (HSSearch.calcFreq(i3, i) * i3) / length, i);
            }
        }
        pageIndexTrieNode.isWordEnd = true;
        pageIndexTrieNode.addFrequency(i2, HSSearch.calcFreq(length, i), i);
    }

    public void createAndStoreTfIdfIndex() {
        this.searchTokenDao = SearchTokenDaoImpl.getInstance();
        char[] cArr = new char[50];
        Iterator<PageIndexTrieNode> it = this.root.getChildren().iterator();
        while (it.hasNext()) {
            createAndStoreTfIdfIndex(it.next(), cArr, 0);
        }
        if (this.searchTokenList.size() > 0) {
            this.searchTokenDao.save(this.searchTokenList);
        }
    }

    private void createAndStoreTfIdfIndex(PageIndexTrieNode pageIndexTrieNode, char[] cArr, int i) {
        if (pageIndexTrieNode == null) {
            return;
        }
        cArr[i] = pageIndexTrieNode.nodeValue;
        if (pageIndexTrieNode.isWordEnd) {
            this.searchTokenList.add(buildTfIdfIndex(new String(cArr, 0, i + 1), pageIndexTrieNode));
            if (this.searchTokenList.size() > 1000) {
                this.searchTokenDao.save(this.searchTokenList);
                this.searchTokenList.clear();
            }
        }
        Iterator<PageIndexTrieNode> it = pageIndexTrieNode.getChildren().iterator();
        while (it.hasNext()) {
            createAndStoreTfIdfIndex(it.next(), cArr, i + 1);
        }
        pageIndexTrieNode.resetChildren();
    }

    private SearchTokenDto buildTfIdfIndex(String str, PageIndexTrieNode pageIndexTrieNode) {
        int maxFrequency = pageIndexTrieNode.getMaxFrequency();
        int faqAppearCount = pageIndexTrieNode.getFaqAppearCount();
        HashMap map = new HashMap();
        SparseArray<Pair<Integer, Integer>> wordFrequencyMap = pageIndexTrieNode.getWordFrequencyMap();
        int iMax = -1;
        for (int i = 0; i < wordFrequencyMap.size(); i++) {
            int iKeyAt = wordFrequencyMap.keyAt(i);
            Pair<Integer, Integer> pairValueAt = wordFrequencyMap.valueAt(i);
            map.put(Integer.valueOf(iKeyAt), Double.valueOf((((double) ((Integer) pairValueAt.first).intValue()) / ((double) maxFrequency)) * Math.log10(((double) this.totalDocCount) / ((double) faqAppearCount)) * ((double) HSSearch.getTermWeight(((Integer) pairValueAt.second).intValue()))));
            iMax = Math.max(iMax, ((Integer) pairValueAt.second).intValue());
        }
        pageIndexTrieNode.resetFrequency();
        return new SearchTokenDto(str, iMax, map);
    }
}
