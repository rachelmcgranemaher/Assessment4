package com.rachel.entities;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    String cartName;

    @OneToMany(targetEntity = Item.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Item> items = new HashSet<>();

    private Cart() {
    }

    public Cart(String cartName) {
        this.cartName = cartName;
    }


    public String getCartName() {
        return cartName;
    }

    public void setCartName(String cartName) {
        this.cartName = cartName;
    }

    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public Set<Item> getItems() {
        return items;
    }


    public void setProducts(Set<Item> items) {
        this.items = items;
    }

    public void add(Item item) {
        boolean found = false;
        for (Item existingItem : items) {
            if (existingItem.getProduct().getId() == item.getProduct().getId()) {
                found = true;
                existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
            }
        }
        if (!found) {
            items.add(item);
        }
    }

    public void remove(Integer productId) {
        for (Item existingItem : items) {
            if (existingItem.getProduct().getId() == productId) {
                items.remove(existingItem);
            }
        }
    }

    public Item getByProductId(Integer productId) {
        for (Item item : items) {
            if (item.getProduct().getId() == productId) {
                return item;
            }
        }
        return null;
    }

}

