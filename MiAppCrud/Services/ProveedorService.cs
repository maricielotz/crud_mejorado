﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using MiAppCrud.Models;

namespace MiAppCrud.Services
{
    public class ProveedorService
    {
        private Database _database;

        public ProveedorService(string dbPath)
        {
            _database = new Database(dbPath);
        }

        public Task<List<Proveedor>> GetAll() => _database.GetAllProveedoresAsync();

        public Task Add(Proveedor proveedor) => _database.SaveProveedorAsync(proveedor);

        public Task Update(Proveedor proveedor) => _database.SaveProveedorAsync(proveedor);

        public Task Delete(int id) => _database.DeleteProveedorAsync(id);
    }
}
