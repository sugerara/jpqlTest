package example.data;

import example.domain.Item;

public class DisplayItem {
	private Item item;
	private boolean onlyInInitial;
	public DisplayItem(Item item, boolean onlyInInitial) {
		super();
		this.setItem(item);
		this.setOnlyInInitial(onlyInInitial);
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public boolean isOnlyInInitial() {
		return onlyInInitial;
	}
	public void setOnlyInInitial(boolean onlyInInitial) {
		this.onlyInInitial = onlyInInitial;
	}
	
	
}
