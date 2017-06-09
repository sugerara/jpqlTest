package example.web;
import example.domain.WorkingModel;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/workingmodels")
@Controller
@RooWebScaffold(path = "workingmodels", formBackingObject = WorkingModel.class)
public class WorkingModelController {

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
		WorkingModel model = WorkingModel.findWorkingModel(id);
        uiModel.addAttribute("workingmodel", model);
        uiModel.addAttribute("itemId", id);
        
        String sql = "SELECT ii, "
        		+ "CASE WHEN EXISTS (SELECT si FROM WorkingModel wm JOIN wm.selectedItem si WHERE wm.modelId = :modelId AND ii.id = si.id) THEN true "
        		+ "ELSE false END "
        		+ "FROM WorkingModel wm JOIN wm.initialItem ii WHERE wm.modelId = :modelId";
        List<?> list = WorkingModel.getData(sql, model.getModelId());

        System.out.println("========================");
        for (Object object : list) {
        	if (object instanceof Object[]) {
        		System.out.println(Arrays.asList((Object[]) object).toString());
        	} else {
        		System.out.println(object.toString());
        	}
        	System.out.println("---------------------------");
		}
        
        return "workingmodels/show";
    }
}
