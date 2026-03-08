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

    override fun getCount(): Int = items.size
    override fun getItem(position: Int): MainActivity.NavItem = items[position]
    override fun getItemId(position: Int): Long = position.toLong()

    override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
        val view = convertView ?: LayoutInflater.from(context)
            .inflate(R.layout.item_nav_menu, parent, false)
        val item = items[position]
        
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
