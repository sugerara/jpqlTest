// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package example.domain;

import example.domain.ItemGroup;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ItemGroup_Roo_Jpa_Entity {
    
    declare @type: ItemGroup: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ItemGroup.id;
    
    @Version
    @Column(name = "version")
    private Integer ItemGroup.version;
    
    public Long ItemGroup.getId() {
        return this.id;
    }
    
    public void ItemGroup.setId(Long id) {
        this.id = id;
    }
    
    public Integer ItemGroup.getVersion() {
        return this.version;
    }
    
    public void ItemGroup.setVersion(Integer version) {
        this.version = version;
    }
    
}
