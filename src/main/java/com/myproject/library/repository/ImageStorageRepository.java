package com.myproject.library.repository;

import com.myproject.library.model.ImageStorage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageStorageRepository extends JpaRepository<ImageStorage,Long> {

}
