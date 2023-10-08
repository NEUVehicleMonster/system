package service.impl;

import com.github.pagehelper.PageHelper;
import dao.IOxtallDao;
import domain.Oxtall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IOxtallService;

import java.util.List;


@Service
@Transactional
public class OxtallServiceImpl implements IOxtallService {

    @Autowired
    private IOxtallDao oxtallDao;

    @Override
    public List<Oxtall> findAll(Integer page, Integer size) {
        //参数pageNum是页码值 参数pageSize代表每页显示条数,而且pageHelper必须放在return上面
        PageHelper.startPage(page,size);
        return oxtallDao.findAll();
    }

    @Override
    public void save(Oxtall oxtall) {
        oxtallDao.save(oxtall);
    }

    @Override
    public Oxtall findById(Integer id) {
        return oxtallDao.findById(id);
    }

    @Override
    public void dropByIds(Integer[] ids) {

        for (int id:ids) {
            oxtallDao.dropById(id);
        }

    }

    @Override
    public void updateById(Oxtall oxtall) {
        oxtallDao.updateById(oxtall);
    }

    @Override
    public List<Oxtall> findAll() {
        return oxtallDao.findAll();
    }

}
