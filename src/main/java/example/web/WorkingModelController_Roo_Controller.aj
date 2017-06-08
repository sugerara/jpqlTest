// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package example.web;

import example.domain.Item;
import example.domain.WorkingModel;
import example.web.WorkingModelController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect WorkingModelController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String WorkingModelController.create(@Valid WorkingModel workingModel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, workingModel);
            return "workingmodels/create";
        }
        uiModel.asMap().clear();
        workingModel.persist();
        return "redirect:/workingmodels/" + encodeUrlPathSegment(workingModel.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String WorkingModelController.createForm(Model uiModel) {
        populateEditForm(uiModel, new WorkingModel());
        return "workingmodels/create";
    }
    
    @RequestMapping(produces = "text/html")
    public String WorkingModelController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("workingmodels", WorkingModel.findWorkingModelEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) WorkingModel.countWorkingModels() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("workingmodels", WorkingModel.findAllWorkingModels(sortFieldName, sortOrder));
        }
        return "workingmodels/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String WorkingModelController.update(@Valid WorkingModel workingModel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, workingModel);
            return "workingmodels/update";
        }
        uiModel.asMap().clear();
        workingModel.merge();
        return "redirect:/workingmodels/" + encodeUrlPathSegment(workingModel.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String WorkingModelController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, WorkingModel.findWorkingModel(id));
        return "workingmodels/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String WorkingModelController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        WorkingModel workingModel = WorkingModel.findWorkingModel(id);
        workingModel.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/workingmodels";
    }
    
    void WorkingModelController.populateEditForm(Model uiModel, WorkingModel workingModel) {
        uiModel.addAttribute("workingModel", workingModel);
        uiModel.addAttribute("items", Item.findAllItems());
    }
    
    String WorkingModelController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
