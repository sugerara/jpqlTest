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
    
    public int WorkingModel.getInfoType() {
        return this.infoType;
    }
    
    public void WorkingModel.setInfoType(int infoType) {
        this.infoType = infoType;
    }
    
    public int WorkingModel.getAnoTran() {
        return this.anoTran;
    }
    
    public void WorkingModel.setAnoTran(int anoTran) {
        this.anoTran = anoTran;
    }
    
    public int WorkingModel.getNoTran() {
        return this.noTran;
    }
    
    public void WorkingModel.setNoTran(int noTran) {
        this.noTran = noTran;
    }
    
}
