package example.web;
import example.domain.ItemGroup;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/itemgroups")
@Controller
@RooWebScaffold(path = "itemgroups", formBackingObject = ItemGroup.class)
public class ItemGroupController {
}
