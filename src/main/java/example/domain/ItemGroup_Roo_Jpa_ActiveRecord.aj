// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package example.domain;

import example.domain.ItemGroup;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ItemGroup_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ItemGroup.entityManager;
    
    public static final List<String> ItemGroup.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name");
    
    public static final EntityManager ItemGroup.entityManager() {
        EntityManager em = new ItemGroup().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ItemGroup.countItemGroups() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ItemGroup o", Long.class).getSingleResult();
    }
    
    public static List<ItemGroup> ItemGroup.findAllItemGroups() {
        return entityManager().createQuery("SELECT o FROM ItemGroup o", ItemGroup.class).getResultList();
    }
    
    public static List<ItemGroup> ItemGroup.findAllItemGroups(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ItemGroup o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ItemGroup.class).getResultList();
    }
    
    public static ItemGroup ItemGroup.findItemGroup(Long id) {
        if (id == null) return null;
        return entityManager().find(ItemGroup.class, id);
    }
    
    public static List<ItemGroup> ItemGroup.findItemGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ItemGroup o", ItemGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ItemGroup> ItemGroup.findItemGroupEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ItemGroup o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ItemGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ItemGroup.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ItemGroup.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ItemGroup attached = ItemGroup.findItemGroup(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ItemGroup.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ItemGroup.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ItemGroup ItemGroup.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ItemGroup merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
