package com.goaltactics.app.ui.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.R
import com.goaltactics.app.data.model.*

// -- Player row adapter (Squad, Scouting, Transfer) --

class PlayerAdapter(
    private val onClick: (SquadPlayerData) -> Unit = {}
) : ListAdapter<SquadPlayerData, PlayerAdapter.ViewHolder>(PlayerDiff) {

    object PlayerDiff : DiffUtil.ItemCallback<SquadPlayerData>() {
        override fun areItemsTheSame(a: SquadPlayerData, b: SquadPlayerData) = a.id == b.id
        override fun areContentsTheSame(a: SquadPlayerData, b: SquadPlayerData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val name: TextView = view.findViewById(R.id.textPlayerName)
        val position: TextView = view.findViewById(R.id.textPosition)
        val strength: TextView = view.findViewById(R.id.textStrength)
        val value: TextView = view.findViewById(R.id.textFitness)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_player_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val player = getItem(position)
        holder.name.text = player.name
        holder.position.text = player.position
        holder.strength.text = player.strength.toString()
        holder.value.text = "FIT: ${player.fitness}"
        holder.itemView.setOnClickListener { onClick(player) }
        // Alternate row colors
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- League table adapter --

class LeagueTableAdapter : ListAdapter<LeagueTableData, LeagueTableAdapter.ViewHolder>(LeagueDiff) {

    object LeagueDiff : DiffUtil.ItemCallback<LeagueTableData>() {
        override fun areItemsTheSame(a: LeagueTableData, b: LeagueTableData) = a.id == b.id
        override fun areContentsTheSame(a: LeagueTableData, b: LeagueTableData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val pos: TextView = view.findViewById(R.id.textPos)
        val name: TextView = view.findViewById(R.id.textName)
        val played: TextView = view.findViewById(R.id.textPlayed)
        val wins: TextView = view.findViewById(R.id.textWins)
        val draws: TextView = view.findViewById(R.id.textDraws)
        val losses: TextView = view.findViewById(R.id.textLosses)
        val goals: TextView = view.findViewById(R.id.textGoals)
        val points: TextView = view.findViewById(R.id.textPoints)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_league_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val entry = getItem(position)
        val w = entry.wins.home + entry.wins.away
        val d = entry.draws.home + entry.draws.away
        val l = entry.losses.home + entry.losses.away
        val m = w + d + l
        val gf = entry.goalsScored.home + entry.goalsScored.away
        val ga = entry.goalsReceived.home + entry.goalsReceived.away
        val pts = entry.points.home + entry.points.away
        holder.pos.text = "${position + 1}"
        holder.name.text = entry.name
        holder.played.text = "$m"
        holder.wins.text = "$w"
        holder.draws.text = "$d"
        holder.losses.text = "$l"
        holder.goals.text = "$gf:$ga"
        holder.points.text = "$pts"
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Ladder adapter --

class LadderAdapter : ListAdapter<LadderTeamData, LadderAdapter.ViewHolder>(LadderDiff) {

    object LadderDiff : DiffUtil.ItemCallback<LadderTeamData>() {
        override fun areItemsTheSame(a: LadderTeamData, b: LadderTeamData) = a.teamId == b.teamId
        override fun areContentsTheSame(a: LadderTeamData, b: LadderTeamData) = a == b  
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val rank: TextView = view.findViewById(R.id.textRank)
        val name: TextView = view.findViewById(R.id.textName)
        val strength: TextView = view.findViewById(R.id.textStrength)
        val points: TextView = view.findViewById(R.id.textPoints)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_ladder_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val team = getItem(position)
        holder.rank.text = "${team.rank}"
        holder.name.text = team.teamName
        holder.strength.text = "${team.strength}"
        holder.points.text = "${team.points}"
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Transfer market adapter --

class TransferAdapter(
    private val onBid: (TransferPlayerData) -> Unit = {}
) : ListAdapter<TransferPlayerData, TransferAdapter.ViewHolder>(TransferDiff) {

    object TransferDiff : DiffUtil.ItemCallback<TransferPlayerData>() {
        override fun areItemsTheSame(a: TransferPlayerData, b: TransferPlayerData) = a.id == b.id
        override fun areContentsTheSame(a: TransferPlayerData, b: TransferPlayerData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val name: TextView = view.findViewById(R.id.textPlayerName)
        val position: TextView = view.findViewById(R.id.textPosition)
        val strength: TextView = view.findViewById(R.id.textStrength)
        val value: TextView = view.findViewById(R.id.textFitness)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_player_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val player = getItem(position)
        holder.name.text = player.name
        holder.position.text = player.position
        holder.strength.text = player.strength.toString()
        holder.value.text = formatCurrency(player.minimumBid.toLong())
        holder.itemView.setOnClickListener { onBid(player) }
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Chat message adapter --

class ChatMessageAdapter : ListAdapter<ChatMessageData, ChatMessageAdapter.ViewHolder>(ChatDiff) {

    object ChatDiff : DiffUtil.ItemCallback<ChatMessageData>() {
        override fun areItemsTheSame(a: ChatMessageData, b: ChatMessageData) = a.id == b.id
        override fun areContentsTheSame(a: ChatMessageData, b: ChatMessageData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val sender: TextView = view.findViewById(R.id.textUserName)
        val message: TextView = view.findViewById(R.id.textMessage)
        val time: TextView = view.findViewById(R.id.textTimestamp)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_chat_message, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val msg = getItem(position)
        holder.sender.text = msg.userName
        holder.message.text = msg.message
        holder.time.text = msg.createdAt
    }
}

// -- Finance adapter --

class FinanceAdapter : ListAdapter<FinanceData, FinanceAdapter.ViewHolder>(FinanceDiff) {

    object FinanceDiff : DiffUtil.ItemCallback<FinanceData>() {
        override fun areItemsTheSame(a: FinanceData, b: FinanceData) = a == b
        override fun areContentsTheSame(a: FinanceData, b: FinanceData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val label: TextView = view.findViewById(R.id.textLabel)
        val value: TextView = view.findViewById(R.id.textValue)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_stat_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val finance = getItem(position)
        holder.label.text = finance.description
        holder.value.text = formatCurrency(finance.value.toLong())
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Scouted player adapter --

class ScoutedPlayerAdapter(
    private val onSign: (ScoutedPlayerData) -> Unit = {}
) : ListAdapter<ScoutedPlayerData, ScoutedPlayerAdapter.ViewHolder>(ScoutDiff) {

    object ScoutDiff : DiffUtil.ItemCallback<ScoutedPlayerData>() {
        override fun areItemsTheSame(a: ScoutedPlayerData, b: ScoutedPlayerData) = a.id == b.id
        override fun areContentsTheSame(a: ScoutedPlayerData, b: ScoutedPlayerData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val name: TextView = view.findViewById(R.id.textPlayerName)
        val position: TextView = view.findViewById(R.id.textPosition)
        val strength: TextView = view.findViewById(R.id.textStrength)
        val value: TextView = view.findViewById(R.id.textFitness)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_player_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val player = getItem(position)
        holder.name.text = player.name
        holder.position.text = player.position
        holder.strength.text = player.strength.toString()
        holder.value.text = "TAL: ${player.talent}"
        holder.itemView.setOnClickListener { onSign(player) }
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Friend adapter --

class FriendAdapter(
    private val onChallenge: (FriendData) -> Unit = {}
) : ListAdapter<FriendData, FriendAdapter.ViewHolder>(FriendDiff) {

    object FriendDiff : DiffUtil.ItemCallback<FriendData>() {
        override fun areItemsTheSame(a: FriendData, b: FriendData) = a.id == b.id
        override fun areContentsTheSame(a: FriendData, b: FriendData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val label: TextView = view.findViewById(R.id.textLabel)
        val value: TextView = view.findViewById(R.id.textValue)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_stat_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val friend = getItem(position)
        holder.label.text = friend.name
        holder.value.text = if (friend.isFriend) "Friend" else "Pending"
        holder.itemView.setOnClickListener { onChallenge(friend) }
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Shop product adapter --

class ShopAdapter(
    private val onBuy: (ShopProductData) -> Unit = {}
) : ListAdapter<ShopProductData, ShopAdapter.ViewHolder>(ShopDiff) {

    object ShopDiff : DiffUtil.ItemCallback<ShopProductData>() {
        override fun areItemsTheSame(a: ShopProductData, b: ShopProductData) = a.id == b.id
        override fun areContentsTheSame(a: ShopProductData, b: ShopProductData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val label: TextView = view.findViewById(R.id.textLabel)
        val value: TextView = view.findViewById(R.id.textValue)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_stat_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val product = getItem(position)
        holder.label.text = product.name
        holder.value.text = "${product.price} coins"
        holder.itemView.setOnClickListener { onBuy(product) }
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Build place adapter (Stadium) --

class BuildPlaceAdapter(
    private val onBuild: (BuildPlaceData) -> Unit = {}
) : ListAdapter<BuildPlaceData, BuildPlaceAdapter.ViewHolder>(BuildDiff) {

    object BuildDiff : DiffUtil.ItemCallback<BuildPlaceData>() {
        override fun areItemsTheSame(a: BuildPlaceData, b: BuildPlaceData) = a.id == b.id
        override fun areContentsTheSame(a: BuildPlaceData, b: BuildPlaceData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val label: TextView = view.findViewById(R.id.textLabel)
        val value: TextView = view.findViewById(R.id.textValue)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_stat_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val place = getItem(position)
        holder.label.text = place.buildingType ?: "Empty Slot"
        holder.value.text = if (place.canBuild) "Lv ${place.level} (upgradable)" else "Lv ${place.level}"
        holder.itemView.setOnClickListener { onBuild(place) }
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Mail adapter --

class MailAdapter(
    private val onClick: (MailData) -> Unit = {}
) : ListAdapter<MailData, MailAdapter.ViewHolder>(MailDiff) {

    object MailDiff : DiffUtil.ItemCallback<MailData>() {
        override fun areItemsTheSame(a: MailData, b: MailData) = a.id == b.id
        override fun areContentsTheSame(a: MailData, b: MailData) = a == b
    }

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val label: TextView = view.findViewById(R.id.textLabel)
        val value: TextView = view.findViewById(R.id.textValue)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_stat_row, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val mail = getItem(position)
        holder.label.text = mail.subject
        holder.value.text = mail.date
        holder.itemView.setOnClickListener { onClick(mail) }
        val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
        holder.itemView.setBackgroundResource(bg)
    }
}

// -- Utility --

fun formatCurrency(amount: Long): String {
    return when {
        amount >= 1_000_000 -> String.format("%.1fM", amount / 1_000_000.0)
        amount >= 1_000 -> String.format("%.1fK", amount / 1_000.0)
        else -> amount.toString()
    }
}
