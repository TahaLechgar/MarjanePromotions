import com.marjanepromotion.dao.AdminDao;
import com.marjanepromotion.models.Admin;
import com.marjanepromotion.util.SessionUtil;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.junit.jupiter.api.Test;

public class ConnectionTest {
    Admin admin = new Admin();
    AdminDao adminDao = new AdminDao();
}
