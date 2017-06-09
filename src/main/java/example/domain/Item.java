package example.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Item {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ItemGroup> belonging = new HashSet<ItemGroup>();
}
