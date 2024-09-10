import tkinter as tk
from tkinter import ttk
import sqlite3
import pandas as pd
import time

class ScrollableFrame(ttk.Frame):
    def __init__(self, container, *args, **kwargs):
        super().__init__(container, *args, **kwargs)
        canvas = tk.Canvas(self)
        scrollbar = ttk.Scrollbar(self, orient="vertical", command=canvas.yview)
        self.scrollable_frame = ttk.Frame(canvas)

        self.scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(
                scrollregion=canvas.bbox("all")
            )
        )

        canvas.create_window((0, 0), window=self.scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

def fetch_and_display_all_tables(root):
    start_time = time.time()  # Measure start time

    connection = sqlite3.connect('dbms.db')

    tables = ['Airplane_type', 'Route', 'Flight', 'AirFare', 'Passengers', 'Countries', 'Airport', 'Employees', 'Can_Land', 'Transactions', 'Travels_on']
    columns = 5 # Number of columns in the grid
    for i, table_name in enumerate(tables):
        query = f"SELECT * FROM {table_name}"
        df = pd.read_sql(query, connection)

        table_frame = ttk.LabelFrame(root.scrollable_frame, text=table_name)
        table_frame.grid(row=i // columns, column=i % columns, padx=5, pady=5, sticky="nsew")

        tree = ttk.Treeview(table_frame, selectmode='browse')
        tree["columns"] = df.columns.tolist()
        tree["show"] = "headings"

        for column in df.columns.tolist():
            tree.heading(column, text=column)
            tree.column(column, anchor="w")

        for index, row in df.iterrows():
            tree.insert("", "end", values=row.tolist())

        scrollbar_y = ttk.Scrollbar(table_frame, orient="vertical", command=tree.yview)
        scrollbar_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scrollbar_y.set)

        scrollbar_x = ttk.Scrollbar(table_frame, orient="horizontal", command=tree.xview)
        scrollbar_x.pack(side="bottom", fill="x")
        tree.configure(xscrollcommand=scrollbar_x.set)

        tree.pack(expand=True, fill="both")

    connection.close()

    end_time = time.time()  # Measure end time
    execution_time = end_time - start_time
    print(f"Total execution time: {execution_time:.2f} seconds")  # Print total execution time

root = tk.Tk()
root.title("Database Tables Viewer")

scrollable_frame = ScrollableFrame(root)
scrollable_frame.pack(expand=True, fill="both")

fetch_and_display_all_tables(scrollable_frame)

root.mainloop()