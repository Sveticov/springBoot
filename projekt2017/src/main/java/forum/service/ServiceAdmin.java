package forum.service;

import forum.model.Admin;
import forum.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ServiceAdmin {
    @Autowired
    AdminRepository adminRepository;

    public List<Admin> findAllAdmin(){
        return adminRepository.findAll();
    }

    public void addNewAdmin(Admin admin){
        adminRepository.save(admin);
    }
}
