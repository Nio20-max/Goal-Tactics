package com.goaltactics.app.ui.fragments

import android.app.AlertDialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.goaltactics.app.data.api.ApiClient
import com.goaltactics.app.R
import com.goaltactics.app.data.model.EquipmentData
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.ShopProductData
import com.goaltactics.app.ui.adapters.ShopAdapter
import com.goaltactics.app.ui.shell.MainActivity
import com.google.android.material.tabs.TabLayout
import kotlinx.coroutines.launch

class ShopFragment : Fragment() {

    private val productAdapter = ShopAdapter { product -> confirmBuy(product) }
    private val equipmentAdapter = EquipmentAdapter { equipment -> useEquipment(equipment) }
    private var currentTab = 0

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_shop, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val recycler = view.findViewById<RecyclerView>(R.id.recyclerShop)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = productAdapter

        val tabLayout = view.findViewById<TabLayout>(R.id.tabLayout)
        tabLayout.addTab(tabLayout.newTab().setText("Products"))
        tabLayout.addTab(tabLayout.newTab().setText("Equipment"))

        tabLayout.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab) {
                currentTab = tab.position
                when (tab.position) {
                    0 -> {
                        recycler.adapter = productAdapter
                        loadProducts()
                    }
                    1 -> {
                        recycler.adapter = equipmentAdapter
                        loadEquipment()
                    }
                }
            }
            override fun onTabUnselected(tab: TabLayout.Tab) {}
            override fun onTabReselected(tab: TabLayout.Tab) {}
        })

        loadProducts()
    }

    private fun loadProducts() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getProducts()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        productAdapter.submitList(data.products)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun loadEquipment() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getEquipment()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        equipmentAdapter.submitList(data.equipment)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun confirmBuy(product: ShopProductData) {
        val ctx = context ?: return
        AlertDialog.Builder(ctx)
            .setTitle("Buy ${product.name}?")
            .setMessage("Price: ${product.price} coins\nCategory: ${product.category ?: "General"}")
            .setPositiveButton("Buy") { _, _ ->
                val main = requireActivity() as MainActivity
                viewLifecycleOwner.lifecycleScope.launch {
                    try {
                        main.showLoading(true)
                        val response = ApiClient.get().buyProduct(IdRequest(product.id))
                        if (response.isSuccessful) {
                            Toast.makeText(context, "Purchased ${product.name}!", Toast.LENGTH_SHORT).show()
                            main.refreshResources()
                            loadProducts()
                        } else {
                            Toast.makeText(context, response.body()?.message ?: "Purchase failed", Toast.LENGTH_SHORT).show()
                        }
                    } catch (_: Exception) {
                    } finally {
                        main.showLoading(false)
                    }
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun useEquipment(equipment: EquipmentData) {
        val ctx = context ?: return
        AlertDialog.Builder(ctx)
            .setTitle("Use ${equipment.name}?")
            .setMessage("Cost: ${equipment.costStars} GT Stars")
            .setPositiveButton("Use") { _, _ ->
                val main = requireActivity() as MainActivity
                viewLifecycleOwner.lifecycleScope.launch {
                    try {
                        main.showLoading(true)
                        val response = ApiClient.get().useEquipment(IdRequest(equipment.id))
                        if (response.isSuccessful) {
                            Toast.makeText(context, "Applied ${equipment.name}!", Toast.LENGTH_SHORT).show()
                            main.refreshResources()
                            loadEquipment()
                        } else {
                            Toast.makeText(context, response.body()?.message ?: "Failed", Toast.LENGTH_SHORT).show()
                        }
                    } catch (_: Exception) {
                    } finally {
                        main.showLoading(false)
                    }
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private class EquipmentAdapter(
        private val onUse: (EquipmentData) -> Unit
    ) : androidx.recyclerview.widget.ListAdapter<EquipmentData, EquipmentAdapter.ViewHolder>(EquipmentDiff) {

        object EquipmentDiff : androidx.recyclerview.widget.DiffUtil.ItemCallback<EquipmentData>() {
            override fun areItemsTheSame(a: EquipmentData, b: EquipmentData) = a.id == b.id
            override fun areContentsTheSame(a: EquipmentData, b: EquipmentData) = a == b
        }

        class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
            val label: android.widget.TextView = view.findViewById(R.id.textLabel)
            val value: android.widget.TextView = view.findViewById(R.id.textValue)
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
            val view = LayoutInflater.from(parent.context)
                .inflate(R.layout.item_stat_row, parent, false)
            return ViewHolder(view)
        }

        override fun onBindViewHolder(holder: ViewHolder, position: Int) {
            val item = getItem(position)
            holder.label.text = item.name
            holder.value.text = "${item.costStars} ★"
            holder.itemView.setOnClickListener { onUse(item) }
            val bg = if (position % 2 == 0) R.color.gt_row_even else R.color.gt_row_odd
            holder.itemView.setBackgroundResource(bg)
        }
    }
}
