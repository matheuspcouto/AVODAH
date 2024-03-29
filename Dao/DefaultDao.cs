﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EscalasMetodista.Dao
{
    interface DefaultDao<T>
    {
        void create(T t);
        void update(T t, int id);
        void delete(int id);
        T find(int id);
    }
}
