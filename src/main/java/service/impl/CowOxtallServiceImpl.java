package service.impl;

import dao.ICowOxtallDao;
import domain.CowOxtall;
import domain.Oxtall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.CowOxtallService;

@Service
@Transactional
public class CowOxtallServiceImpl implements CowOxtallService {
    @Autowired
    private ICowOxtallDao cowOxtallDao;

    @Override
    public CowOxtall findByCowId(int id) {
        return cowOxtallDao.findByCowId(id);
    }
}
