function arrayToCSV(columnNames, data) {
    const header = columnNames.join("\t");
    const rows = data.map(row => row.join("\t"));
    return [header, ...rows].join("\n");
}

export default arrayToCSV
