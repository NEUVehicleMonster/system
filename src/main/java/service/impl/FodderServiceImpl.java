package service.impl;

import com.github.pagehelper.PageHelper;
import dao.IFodderDao;
import domain.Fodder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IFodderService;

import java.util.List;


@Service
@Transactional
public class FodderServiceImpl implements IFodderService {

    @Autowired
    private IFodderDao fodderDao;

    @Override
    public List<Fodder> findAll(Integer page, Integer size) {
        //参数pageNum是页码值 参数pageSize代表每页显示条数,而且pageHelper必须放在return上面
        PageHelper.startPage(page,size);
        return fodderDao.findAll();
    }

    @Override
    public void save(Fodder fodder) {
        fodderDao.save(fodder);
    }

    @Override
    public Fodder findById(Integer id) {
        return fodderDao.findById(id);
    }

    @Override
    public void dropByIds(Integer[] ids) {

        for (int id:ids) {
            fodderDao.dropById(id);
        }

    }

    @Override
    public void updateById(Fodder fodder) {
        fodderDao.updateById(fodder);
    }

    @Override
    public List<Fodder> findAll() {
        return fodderDao.findAll();
    }
}
