package example.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.Query;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class WorkingModel {

    /**
     */
    @NotNull
    @Column(unique = true)
    private int modelId;

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Item> initialItem = new HashSet<Item>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Item> selectedItem = new HashSet<Item>();
    
    public static List<?> getData(String sql, Integer id) {
    	Query query = entityManager().createQuery(sql);
    	query.setParameter("modelId", id);
    	List<?> list = query.getResultList();
    	return list;
    }
}
