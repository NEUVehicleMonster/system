package service;

import domain.Feed;

import java.util.List;

public interface IFeedService {
    List<Feed> findAll(Integer page, Integer size);

    void save(Feed feed);

    Feed findById(Integer id);

    void dropByIds(Integer[] ids);

    void updateById(Feed feed);

    List<Feed> findAll();
}
