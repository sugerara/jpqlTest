// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package example.domain;

import example.domain.Item;
import example.domain.WorkingModel;
import java.util.Set;

privileged aspect WorkingModel_Roo_JavaBean {
    
    public int WorkingModel.getModelId() {
        return this.modelId;
    }
    
    public void WorkingModel.setModelId(int modelId) {
        this.modelId = modelId;
    }
    
    public String WorkingModel.getName() {
        return this.name;
    }
    
    public void WorkingModel.setName(String name) {
        this.name = name;
    }
    
    public Set<Item> WorkingModel.getInitialItem() {
        return this.initialItem;
    }
    
    public void WorkingModel.setInitialItem(Set<Item> initialItem) {
        this.initialItem = initialItem;
    }
    
    public Set<Item> WorkingModel.getSelectedItem() {
        return this.selectedItem;
    }
    
    public void WorkingModel.setSelectedItem(Set<Item> selectedItem) {
        this.selectedItem = selectedItem;
    }
    
}
