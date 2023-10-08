package service.impl;

import com.github.pagehelper.PageHelper;
import dao.IFeedDao;
import domain.Feed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IFeedService;

import java.util.List;


@Service
@Transactional
public class FeedServiceImpl implements IFeedService {

    @Autowired
    private IFeedDao feedDao;

    @Override
    public List<Feed> findAll(Integer page, Integer size) {
        //参数pageNum是页码值 参数pageSize代表每页显示条数,而且pageHelper必须放在return上面
        PageHelper.startPage(page,size);
        return feedDao.findAll();
    }

    @Override
    public void save(Feed feed) {
        feedDao.save(feed);
    }

    @Override
    public Feed findById(Integer id) {
        return feedDao.findById(id);
    }

    @Override
    public void dropByIds(Integer[] ids) {

        for (int id:ids) {
            feedDao.dropById(id);
        }

    }

    @Override
    public void updateById(Feed feed) {
        feedDao.updateById(feed);
    }

    @Override
    public List<Feed> findAll() {
        return feedDao.findAll();    }
}
