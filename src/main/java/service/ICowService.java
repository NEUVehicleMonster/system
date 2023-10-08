package service;

import domain.Cow;

import java.util.List;

public interface ICowService {
    List<Cow> findAll(Integer page, Integer size);

    void save(Cow cow);

    Cow findById(Integer id);

    void dropByIds(Integer[] ids);

    void updateById(Cow cow);

    List<Cow> findAll();
}
