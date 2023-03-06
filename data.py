# 从百度图片搜索，通过关键字获取图片
# 然后写入某一个训练的文件夹下
# 

save_path = '/content/train_data'

def get_baidu_image(keywords: str, limit: int):
    from baiduspider import BaiduSpider
    from pprint import pprint
    import pooch
    import os
    # it's the right file (not corrupted or outdated).
    pn = 1
    count = 0
    loop = 0
    while count < limit:
        files = BaiduSpider().search_pic(keywords, pn=pn).plain
        for idx, file_doc in enumerate(files):
            if count > limit:
                return
            # print(file_doc)
            try:
                path = '-'.join(keywords.split(" "))
                pooch.retrieve(url=file_doc['url'], known_hash=None,
                                path=os.path.join(save_path, path, "origin"),
                                fname="idx_" + str(idx) + ".jpg")
            except Exception as ex:
                print(ex)
        pn += 1
        loop += 1
        if loop > 3:
            return


get_baidu_image("抖音 彭十六", limit=100)