package example.domain;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

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

    public static <T> List<T> getData(String sql, Class<T> clazz, Object arg) {
        TypedQuery<T> query = entityManager().createQuery(sql, clazz);
        query.setParameter("modelId", arg);
        List<T> list = query.getResultList();
        return list;
    }

    /**
     */
    private int infoType;

    /**
     */
    private transient int tran;

    /**
     */
    @Transient
    private int anoTran;

    /**
     */
    private int noTran;
}
