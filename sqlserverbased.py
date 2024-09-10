import threading
import tkinter as tk
from tkinter import ttk
from sqlalchemy import create_engine
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import time

class ScrollableFrame(ttk.Frame):
    def __init__(self, container, *args, **kwargs):
        super().__init__(container, *args, **kwargs)
        self.canvas = tk.Canvas(self)
        v_scrollbar = ttk.Scrollbar(self, orient="vertical", command=self.canvas.yview)
        h_scrollbar = ttk.Scrollbar(self, orient="horizontal", command=self.canvas.xview)
        self.scrollable_frame = ttk.Frame(self.canvas)
        self.scrollable_frame.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))
        self.canvas.create_window((0, 0), window=self.scrollable_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=v_scrollbar.set)
        self.canvas.configure(xscrollcommand=h_scrollbar.set)
        self.canvas.pack(side="left", fill="both", expand=True)
        v_scrollbar.pack(side="right", fill="y")
        h_scrollbar.pack(side="bottom", fill="x")

def fetch_and_display_all_tables(root):
    connection_string = "mysql+mysqlconnector://root:1234@localhost/dbms"
    engine = create_engine(connection_string)
    tables = ['Airplane_type', 'Route', 'Flight', 'AirFare', 'Passengers', 'Countries', 'Airport', 'Employees', 'Can_Land', 'Transactions', 'Travels_on']
    columns = 5 

    for i, table_name in enumerate(tables):
        query = f"SELECT * FROM {table_name}"
        df = pd.read_sql(query, engine)
        table_frame = ttk.LabelFrame(root.scrollable_frame, text=table_name)
        table_frame.grid(row=i // columns, column=i % columns, padx=5, pady=5, sticky="nsew")
        tree = ttk.Treeview(table_frame)
        tree["columns"] = df.columns.tolist()
        tree["show"] = "headings"
        for column in df.columns.tolist():
            tree.heading(column, text=column)
        for index, row in df.iterrows():
            tree.insert("", "end", values=row.tolist())
        scrollbar_y = ttk.Scrollbar(table_frame, orient="vertical", command=tree.yview)
        scrollbar_y.pack(side="right", fill="y")
        tree.configure(yscrollcommand=scrollbar_y.set)
        scrollbar_x = ttk.Scrollbar(table_frame, orient="horizontal", command=tree.xview)
        scrollbar_x.pack(side="bottom", fill="x")
        tree.configure(xscrollcommand=scrollbar_x.set)
        tree.pack(expand=True, fill="both")

def display_graph():
    connection_string = "mysql+mysqlconnector://root:1234@localhost/dbms"
    engine = create_engine(connection_string)
    tables = ['Airplane_type', 'Route', 'Flight', 'AirFare', 'Passengers', 'Countries', 'Airport', 'Employees', 'Can_Land', 'Transactions', 'Travels_on']
    table_counts = []
    for table_name in tables:
        query = f"SELECT * FROM {table_name}"
        df = pd.read_sql(query, engine)
        table_counts.append(len(df))
    plt.figure(figsize=(14, 8))
    sns.barplot(x=tables, y=table_counts)
    plt.title('Number of rows in each table')
    plt.xticks(rotation=90)
    canvas = FigureCanvasTkAgg(plt.gcf(), master=scrollable_frame.scrollable_frame)
    canvas.draw()
    plot_row = len(tables) // 5 + 1
    canvas.get_tk_widget().grid(row=plot_row, column=0, columnspan=5, sticky="nsew")

def insert_data(table_name, data):
    connection_string = "mysql+mysqlconnector://root:1234@localhost/dbms"
    engine = create_engine(connection_string)
    df = pd.DataFrame(data, index=[0])
    df = df.replace('', pd.NA)
    df.to_sql(table_name, con=engine, if_exists='append', index=False)

def add_data_entry_widgets(root):
    add_data_frame = ttk.LabelFrame(root, text="Add Data")
    add_data_frame.pack(side=tk.BOTTOM, pady=10, padx=10)
    
    selected_table = tk.StringVar()
    selected_table.set("Select Table")
    table_options = ['Airplane_type', 'Route', 'Flight', 'AirFare', 'Passengers', 'Countries', 'Airport', 'Employees', 'Can_Land', 'Transactions', 'Travels_on']
    table_dropdown = ttk.OptionMenu(add_data_frame, selected_table, *table_options)
    table_dropdown.grid(row=0, column=0, padx=5, pady=5)
    
    data_entry_widgets = []
    def add_entry_widgets():
        table_frame = ttk.Frame(add_data_frame)
        table_frame.grid(row=len(data_entry_widgets) + 1, column=0, padx=5, pady=5)
        data_entry_widgets.append(table_frame)
        
        connection_string = "mysql+mysqlconnector://root:1234@localhost/dbms"
        engine = create_engine(connection_string)
        table_name = selected_table.get()
        df = pd.read_sql(f"SELECT * FROM {table_name} LIMIT 1", engine)
        columns = df.columns.tolist()
        
        for i, column in enumerate(columns):
            label = ttk.Label(table_frame, text=column)
            label.grid(row=i, column=0, padx=5, pady=5)
            entry = ttk.Entry(table_frame)
            entry.grid(row=i, column=1, padx=5, pady=5)
            data_entry_widgets[-1].columnconfigure(1, weight=1)
    
    add_button = ttk.Button(add_data_frame, text="Add Row", command=add_entry_widgets)
    add_button.grid(row=0, column=1, padx=5, pady=5)

    def submit_data(table_name):
        data = {}
        for widget_frame in data_entry_widgets:
            for child in widget_frame.winfo_children():
                if isinstance(child, ttk.Entry):
                    data[child.master.winfo_children()[0]["text"]] = child.get()
        insert_data(table_name, data)

    submit_button = ttk.Button(add_data_frame, text="Submit", command=lambda: submit_data(selected_table.get()))
    submit_button.grid(row=0, column=2, padx=5, pady=5)

def update_data_periodically(root):
    while True:
        # Fetch and display updated data
        fetch_and_display_all_tables(root)
        # Update the graph
        display_graph()
        # Sleep for a certain interval (e.g., 5 seconds)
        time.sleep(5)

root = tk.Tk()
root.title("Database Tables Viewer")

scrollable_frame = ScrollableFrame(root)
scrollable_frame.pack(expand=True, fill="both", side="left")

info_frame = tk.Frame(root, width=200)
info_frame.pack(side="right", fill="y", expand=False)

time_complexity_label = tk.Label(info_frame, text="Time Complexity: O(m*n)", justify="left")
time_complexity_label.pack(pady=10, padx=10)

btn_display_graph = tk.Button(root, text="Display Graph", command=display_graph)
btn_display_graph.pack(side=tk.TOP, pady=12)

# Start a thread to update data periodically
update_data_thread = threading.Thread(target=update_data_periodically, args=(root,))
update_data_thread.start()

add_data_entry_widgets(root)

root.mainloop()
