package com.helpshift.support.search.tfidf;

import android.util.Pair;
import android.util.SparseArray;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class PageIndexTrieNode implements Serializable {
    public boolean isWordEnd;
    public final char nodeValue;
    private List<PageIndexTrieNode> children = new ArrayList();
    private SparseArray<Pair<Integer, Integer>> wordFrequency = new SparseArray<>();

    public PageIndexTrieNode(char c) {
        this.nodeValue = c;
    }

    public List<PageIndexTrieNode> getChildren() {
        return this.children;
    }

    public PageIndexTrieNode getChild(char c) {
        List<PageIndexTrieNode> list = this.children;
        if (list == null) {
            return null;
        }
        for (PageIndexTrieNode pageIndexTrieNode : list) {
            if (pageIndexTrieNode.nodeValue == c) {
                return pageIndexTrieNode;
            }
        }
        return null;
    }

    public int getFaqAppearCount() {
        return this.wordFrequency.size();
    }

    public SparseArray<Pair<Integer, Integer>> getWordFrequencyMap() {
        return this.wordFrequency;
    }

    public int getMaxFrequency() {
        int iMax = 0;
        for (int i = 0; i < this.wordFrequency.size(); i++) {
            iMax = Math.max(iMax, ((Integer) this.wordFrequency.valueAt(i).first).intValue());
        }
        return iMax;
    }

    public void addFrequency(int i, int i2, int i3) {
        Pair<Integer, Integer> pair;
        Pair<Integer, Integer> pair2 = this.wordFrequency.get(i);
        if (pair2 == null) {
            pair = new Pair<>(Integer.valueOf(i2), Integer.valueOf(i3));
        } else {
            pair = new Pair<>(Integer.valueOf(((Integer) pair2.first).intValue() + i2), Integer.valueOf(((Integer) pair2.second).intValue()));
        }
        this.wordFrequency.put(i, pair);
    }

    public void addChild(PageIndexTrieNode pageIndexTrieNode) {
        this.children.add(pageIndexTrieNode);
    }

    public void resetFrequency() {
        this.wordFrequency = null;
    }

    public void resetChildren() {
        this.children = null;
    }
}
