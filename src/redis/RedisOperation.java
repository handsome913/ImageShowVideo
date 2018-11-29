package redis;
import redis.clients.jedis.Jedis;

public class RedisOperation {

    private  final String redisKey="FileInfo";

    //将数据插入redis数据库中的表FileInfo中
    public Long  addFileInfo(String start){
          Jedis jedis = new Jedis("localhost");
          return jedis.lpush(redisKey,start);
    }
   //从redis数据库中获得FileInfo表尾数据
    public String getFileInfo(){
        Jedis jedis =new Jedis("localhost");
        return jedis.rpop(redisKey);
    }
    //获得redis数据库中表FileInfo的长度
    public Long getFileInfoLength(){
         Jedis jedis= new Jedis("localhost");
         return jedis.llen(redisKey);
    }

}
