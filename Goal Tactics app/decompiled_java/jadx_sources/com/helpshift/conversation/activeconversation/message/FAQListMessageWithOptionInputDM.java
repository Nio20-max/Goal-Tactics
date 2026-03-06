package com.helpshift.conversation.activeconversation.message;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class FAQListMessageWithOptionInputDM extends FAQListMessageDM {
    public static final String KEY_SUGGESTIONS_READ_FAQ_PREFIX = "read_faq_";
    public OptionInput input;
    private ArrayList<String> readFAQs;

    public FAQListMessageWithOptionInputDM(String str, String str2, String str3, long j, Author author, List<FAQListMessageDM.FAQ> list, String str4, String str5, boolean z, String str6, String str7, List<OptionInput.Option> list2) {
        super(str, str2, str3, j, author, list, str4, MessageType.FAQ_LIST_WITH_OPTION_INPUT);
        this.input = new OptionInput(str5, z, str6, str7, list2, OptionInput.Type.PILL);
    }

    public FAQListMessageWithOptionInputDM(String str, String str2, String str3, long j, Author author, List<FAQListMessageDM.FAQ> list, String str4, String str5, boolean z, String str6, String str7, List<OptionInput.Option> list2, boolean z2, String str8) {
        super(str, str2, str3, j, author, list, str4, MessageType.FAQ_LIST_WITH_OPTION_INPUT);
        this.input = new OptionInput(str5, z, str6, str7, list2, OptionInput.Type.PILL);
        this.isSuggestionsReadEventSent = z2;
        this.suggestionsReadFAQPublishId = str8;
    }

    private FAQListMessageWithOptionInputDM(FAQListMessageWithOptionInputDM fAQListMessageWithOptionInputDM) {
        super((FAQListMessageDM) fAQListMessageWithOptionInputDM);
        this.input = fAQListMessageWithOptionInputDM.input.deepClone();
        this.readFAQs = fAQListMessageWithOptionInputDM.readFAQs == null ? null : new ArrayList<>(fAQListMessageWithOptionInputDM.readFAQs);
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void setDependencies(Domain domain, Platform platform) {
        super.setDependencies(domain, platform);
        populateReadFAQs();
    }

    @Override // com.helpshift.conversation.activeconversation.message.FAQListMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof FAQListMessageWithOptionInputDM) {
            this.input = ((FAQListMessageWithOptionInputDM) messageDM).input;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.FAQListMessageDM
    public void handleSuggestionClick(ConversationServerInfo conversationServerInfo, UserDM userDM, String str, String str2) {
        if (this.readFAQs.size() < 10) {
            this.readFAQs.add(str);
            this.platform.getKVStore().setSerializable(KEY_SUGGESTIONS_READ_FAQ_PREFIX + this.serverId, this.readFAQs);
        }
        super.handleSuggestionClick(conversationServerInfo, userDM, str, str2);
    }

    private void populateReadFAQs() {
        if (this.readFAQs == null) {
            this.readFAQs = new ArrayList<>();
            Object serializable = this.platform.getKVStore().getSerializable(KEY_SUGGESTIONS_READ_FAQ_PREFIX + this.serverId);
            if (serializable instanceof ArrayList) {
                this.readFAQs = (ArrayList) serializable;
            }
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.FAQListMessageDM, com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public FAQListMessageWithOptionInputDM deepClone() {
        return new FAQListMessageWithOptionInputDM(this);
    }
}
