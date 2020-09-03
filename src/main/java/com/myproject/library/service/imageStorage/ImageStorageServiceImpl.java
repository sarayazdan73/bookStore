package com.myproject.library.service.imageStorage;

import com.myproject.library.model.ImageStorage;
import com.myproject.library.repository.ImageStorageRepository;
import com.myproject.library.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageStorageServiceImpl implements ImageStorageService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    ImageStorageRepository imageStorageRepository;
    @Override
    public String downloadFile(long id) {
        ImageStorage imageStorage = imageStorageRepository.getOne(id);
        return imageStorage.getFileDir()+"/"+imageStorage.getFileName();
    }
}
