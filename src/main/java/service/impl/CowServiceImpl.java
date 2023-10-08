package service.impl;

import com.github.pagehelper.PageHelper;
import dao.ICowDao;
import domain.Cow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.ICowService;

import java.util.List;


@Service
@Transactional
public class CowServiceImpl implements ICowService {

    @Autowired
    private ICowDao cowDao;

    @Override
    public List<Cow> findAll(Integer page, Integer size) {
        //参数pageNum是页码值 参数pageSize代表每页显示条数,而且pageHelper必须放在return上面
        PageHelper.startPage(page,size);
        return cowDao.findAll();
    }

    @Override
    public void save(Cow cow) {
        cowDao.boundCowAndOxtall(cow.getOxtall_id(),cow.getId());
        cowDao.save(cow);
    }

    @Override
    public Cow findById(Integer id) {
        return cowDao.findById(id);
    }

    @Override
    public void dropByIds(Integer[] ids) {

        for (int id:ids) {
            cowDao.dropById(id);
        }

    }

    @Override
    public void updateById(Cow cow) {
        cowDao.updateById(cow);
    }

    @Override
    public List<Cow> findAll() {
        return cowDao.findAll();
    }
}
