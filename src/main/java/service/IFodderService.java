package service;

import domain.Fodder;

import java.util.List;

public interface IFodderService {
    List<Fodder> findAll(Integer page, Integer size);

    void save(Fodder fodder);

    Fodder findById(Integer id);

    void dropByIds(Integer[] ids);

    void updateById(Fodder fodder);

    List<Fodder> findAll();
}
