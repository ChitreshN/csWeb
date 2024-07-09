const data = [
    {
        "Show": true,
        "Title": "Advanced Computer Architecture",
        "Last Modified": "2022/05/15",
        "Core": ["msocd"],
        "CoreMSOCD": "Yes",
        "CoreMCAM": "No",
        "CoreUG": "No",
        "Credits": "3-0-0-3",
        "Category": "PMT",
        "Proposingfaculty": "Sandeep Chandran",
        "Proposingfaculty2": "Vivek Chaturvedi",
        "Proposingfaculty3": "",
        "Proposingfaculty4": null,
        "Curriculum": "2020",
        "Senate approved on": "11",
        "Prerequisites": "A basic course on Computer Organization/Architecture",
        "Status": "new",
        "Prerevision code": "",
        "Dual code": "",
        "Revision info": "This course will replace another course offered under the same name by the CSE Department (CS4505: Advanced Computer Architecture). The original course will be discontinued going forward. The syllabus of this course is tailored to suit graduate students.",
        "Faculty": "",
        "Code": "CS5019",
        "Remarks": null
    },
    {
        "Show": false,
        "Title": "Machine Learning",
        "Last Modified": "2023/01/10",
        "Core": ["mcam"],
        "CoreMSOCD": "No",
        "CoreMCAM": "Yes",
        "CoreUG": "Yes",
        "Credits": "3-0-0-3",
        "Category": "PMT",
        "Proposingfaculty": "John Doe",
        "Proposingfaculty2": "Jane Doe",
        "Proposingfaculty3": "Another Faculty",
        "Proposingfaculty4": "More Faculty",
        "Curriculum": "2021",
        "Senate approved on": "12",
        "Prerequisites": "A basic course on Machine Learning",
        "Status": "existing",
        "Prerevision code": "ML101",
        "Dual code": "ML201",
        "Revision info": "Updated syllabus to include deep learning modules.",
        "Faculty": "John Doe",
        "Code": "CS5020",
        "Remarks": "This course is popular."
    }
];

const valuesArray = data.map(obj => Object.values(obj));

console.log(valuesArray);
