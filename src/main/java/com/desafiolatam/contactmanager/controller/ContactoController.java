package com.desafiolatam.contactmanager.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import com.desafiolatam.contactmanager.model.Contacto;


@Controller
@RequestMapping("/contactManager")
public class ContactoController {

	@Autowired
	Contacto contacto;
	
	
	private List<Contacto> listaContacto;
	
	
	ContactoController() {
		super();
		listaContacto = new ArrayList<Contacto>();
	}

	
	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String getContactList(ModelMap model) {
		
		if(contacto.getIdContacto() > 0) {
			listaContacto.add(contacto);
		}
		
		model.put("listaContacto", listaContacto);
		
		return "contactManager";
	}
	
	@RequestMapping(value="/addContact", method=RequestMethod.POST)
	public String addContact(ModelMap model, @ModelAttribute("contacto") Contacto contacto) {
		contacto.setIdContacto(listaContacto.size() + 1);
		listaContacto.add(contacto);
		model.put("listaContacto", listaContacto);
		return "contactManager";
	}
	
	@RequestMapping(value="/deleteContact", method=RequestMethod.GET)
	public String deleteContact(ModelMap model, @RequestParam("id") int id) {
		listaContacto.remove(id - 1);
		model.put("listaContacto", listaContacto);
		return "contactManager";
	}
	
}