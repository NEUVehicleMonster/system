package service;

import domain.Oxtall;

import java.util.List;

public interface IOxtallService {
    List<Oxtall> findAll(Integer page, Integer size);

    void save(Oxtall oxtall);

    Oxtall findById(Integer id);

    void dropByIds(Integer[] ids);

    void updateById(Oxtall oxtall);

    List<Oxtall> findAll();


}
