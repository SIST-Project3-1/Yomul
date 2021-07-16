package com.yomul.service;

import com.yomul.vo.FileVO;
import com.yomul.vo.TownVO;

public interface TownService {

	boolean getTownWrite(TownVO town, FileVO file);

}
