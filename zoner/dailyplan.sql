SELECT 
    dp.project AS "Project:Link/Project:100",
    dp.task AS "Task:Link/Task:150",
    dp.man_power_total_cost AS "Man Power Plan:Data:120",
    ts.man_power_total_cost AS "Man Power Used:Data:100",
    dp.equipment_total_cost AS "Machinery Planned:Data:120",
    ts.equipment_total_cost AS "Machinery Used:Data:100",
    dp.material_total_cost AS "Material Plan:Data:120",
    ts.material_total_cost AS "Material Used:Data:100"
FROM
    `tabDaily Plan` dp
JOIN
    `tabTimesheet` ts where dp.task=ts.task_name

