package com.helpshift.conversation.util.predicate;

import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.util.Predicate;

/* JADX INFO: loaded from: classes2.dex */
public class MessagePredicates {
    public static Predicate<MessageDM> olderThanLastDbMessagePredicate(final long j) {
        return new Predicate<MessageDM>() { // from class: com.helpshift.conversation.util.predicate.MessagePredicates.1
            @Override // com.helpshift.util.Predicate
            public boolean matches(MessageDM messageDM) {
                return messageDM.getEpochCreatedAtTime() >= j;
            }
        };
    }
}
