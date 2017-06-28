package example.web;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import example.data.DisplayItem;
import example.domain.ItemGroup;
import example.domain.WorkingModel;

@RequestMapping("/workingmodels")
@Controller
@RooWebScaffold(path = "workingmodels", formBackingObject = WorkingModel.class)
public class WorkingModelController {

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
		WorkingModel model = WorkingModel.findWorkingModel(id);
        uiModel.addAttribute("workingmodel", model);
        uiModel.addAttribute("itemId", id);
        
        String sql = "SELECT NEW example.data.DisplayItem("
        		+ "ii, "
        		+ "CASE WHEN EXISTS (SELECT si FROM WorkingModel wm JOIN wm.selectedItem si WHERE wm.modelId = :modelId AND ii.id = si.id) THEN true "
        		+ "ELSE false END )"
        		+ "FROM WorkingModel wm JOIN wm.initialItem ii WHERE wm.modelId = :modelId";
        List<DisplayItem> list = WorkingModel.getData(sql, DisplayItem.class, model.getModelId());

        System.out.println("========================");
        for (DisplayItem displayItem : list) {
			System.out.println("item name:" + displayItem.getItem().getName());
			StringBuilder sb = new StringBuilder();
			for (ItemGroup group : displayItem.getItem().getBelonging()) {
				sb.append(group.getName() + ",");
			}
			if (sb.length() > 0) {
				sb.deleteCharAt(sb.length() - 1);
				System.out.println("groups:" + sb.toString());
			}
			System.out.println(displayItem.isOnlyInInitial());
			System.out.println("------------------------");
		}
//        for (Object object : list) {
//        	if (object instanceof Object[]) {
//        		System.out.println(Arrays.asList((Object[]) object).toString());
//        	} else {
//        		System.out.println(object.toString());
//        	}
//        	System.out.println("---------------------------");
//		}
        
        return "workingmodels/show";
    }

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid WorkingModel workingModel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, workingModel);
            return "workingmodels/create";
        }
        System.out.println("create:infoType = " + workingModel.getInfoType());
        uiModel.asMap().clear();
        workingModel.persist();
        return "redirect:/workingmodels/" + encodeUrlPathSegment(workingModel.getId().toString(), httpServletRequest);
    }
}
