package com.goaltactics.app.ui.fragments

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
import com.goaltactics.app.data.model.IdRequest
import com.goaltactics.app.data.model.ShopProductData
import com.goaltactics.app.ui.adapters.ShopAdapter
import com.goaltactics.app.ui.shell.MainActivity
import kotlinx.coroutines.launch

class ShopFragment : Fragment() {

    private val adapter = ShopAdapter { product -> buyProduct(product) }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        return inflater.inflate(R.layout.fragment_shop, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val recycler = view.findViewById<RecyclerView>(R.id.recyclerShop)
        recycler.layoutManager = LinearLayoutManager(context)
        recycler.adapter = adapter
        loadShop()
    }

    private fun loadShop() {
        val main = requireActivity() as MainActivity
        main.showLoading(true)

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                val response = ApiClient.get().getProducts()
                if (response.isSuccessful) {
                    response.body()?.let { data ->
                        adapter.submitList(data.products)
                    }
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }

    private fun buyProduct(product: ShopProductData) {
        val main = requireActivity() as MainActivity

        viewLifecycleOwner.lifecycleScope.launch {
            try {
                main.showLoading(true)
                val response = ApiClient.get().buyProduct(IdRequest(product.id))
                if (response.isSuccessful) {
                    Toast.makeText(context, "Purchased ${product.name}", Toast.LENGTH_SHORT).show()
                    main.refreshResources()
                    loadShop()
                }
            } catch (_: Exception) {
            } finally {
                main.showLoading(false)
            }
        }
    }
}
