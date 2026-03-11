package com.goaltactics.app.ui.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import com.goaltactics.app.R
import com.goaltactics.app.ui.shell.MainActivity

class NavMenuAdapter(
    private val context: Context,
    private val items: List<MainActivity.NavItem>
) : BaseAdapter() {

    companion object {
        private const val TYPE_ITEM = 0
        private const val TYPE_SECTION = 1
    }

    override fun getCount(): Int = items.size
    override fun getItem(position: Int): MainActivity.NavItem = items[position]
    override fun getItemId(position: Int): Long = position.toLong()
    override fun getViewTypeCount(): Int = 2
    override fun getItemViewType(position: Int): Int =
        if (items[position].isSection) TYPE_SECTION else TYPE_ITEM

    override fun isEnabled(position: Int): Boolean = !items[position].isSection

    override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
        val item = items[position]
        if (item.isSection) {
            val view = convertView ?: LayoutInflater.from(context)
                .inflate(R.layout.item_nav_section, parent, false)
            view.findViewById<TextView>(R.id.textSectionTitle).text = item.title
            return view
        }

        val view = convertView ?: LayoutInflater.from(context)
            .inflate(R.layout.item_nav_menu, parent, false)
        
        view.findViewById<TextView>(R.id.textNavItem).text = item.title
        
        val iconView = view.findViewById<ImageView>(R.id.imgNavIcon)
        val resId = context.resources.getIdentifier(item.iconName, "drawable", context.packageName)
        if (resId != 0) {
            iconView.setImageResource(resId)
            iconView.visibility = View.VISIBLE
        } else {
            iconView.visibility = View.INVISIBLE
        }
        
        return view
    }
}
