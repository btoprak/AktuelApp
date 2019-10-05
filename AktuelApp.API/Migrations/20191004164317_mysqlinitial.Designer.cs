﻿// <auto-generated />
using System;
using AktuelApp.API.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace AktuelApp.API.Migrations
{
    [DbContext(typeof(AktuelListContext))]
    [Migration("20191004164317_mysqlinitial")]
    partial class mysqlinitial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.11-servicing-32099")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("AktuelApp.API.Models.Aktuel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("AktuelId");

                    b.Property<string>("AktuelImageUrl");

                    b.Property<string>("AktuelName");

                    b.Property<int>("CompanyId");

                    b.Property<DateTime>("ReleasedDate");

                    b.HasKey("Id");

                    b.ToTable("Aktuels");
                });

            modelBuilder.Entity("AktuelApp.API.Models.AktuelDetail", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("AktuelId");

                    b.Property<string>("Content");

                    b.Property<string>("PageImageUrl");

                    b.HasKey("Id");

                    b.ToTable("AktuelDetails");
                });

            modelBuilder.Entity("AktuelApp.API.Models.Company", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AktuelImageUrl");

                    b.Property<int>("CompanyId");

                    b.Property<string>("CompanyName");

                    b.HasKey("Id");

                    b.ToTable("Companies");
                });

            modelBuilder.Entity("AktuelApp.API.Models.Value", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Name");

                    b.HasKey("Id");

                    b.ToTable("Values");
                });
#pragma warning restore 612, 618
        }
    }
}