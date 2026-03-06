package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.support.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class AgentTypingMessageDataBinder {
    private Context context;

    AgentTypingMessageDataBinder(Context context) {
        this.context = context;
    }

    public RecyclerView.ViewHolder createViewHolder(ViewGroup viewGroup) {
        View viewInflate = LayoutInflater.from(this.context).inflate(R.layout.hs__msg_agent_typing, viewGroup, false);
        Styles.setAdminChatBubbleColor(this.context, viewInflate.findViewById(R.id.agent_typing_container).getBackground());
        return new ViewHolder(viewInflate);
    }

    public void bind(ViewHolder viewHolder, boolean z) {
        if (z) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) viewHolder.typingContainer.getLayoutParams();
            marginLayoutParams.setMargins((int) this.context.getResources().getDimension(R.dimen.hs__author_avatar_size), marginLayoutParams.topMargin, marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
        }
    }

    public final class ViewHolder extends RecyclerView.ViewHolder {
        LinearLayout typingContainer;

        public ViewHolder(View view) {
            super(view);
            this.typingContainer = (LinearLayout) view.findViewById(R.id.agent_typing_container);
        }
    }
}
