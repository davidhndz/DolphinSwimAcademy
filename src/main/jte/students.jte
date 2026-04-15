@import cs3220.lab8.model.Student
@import java.util.ArrayList

@param ArrayList<Student> students
@param int session

@template.layout(title = "Students", content = @`
    <body>
    <form action="/students" method="get" >
        <div class="d-flex flex-row gap-4 my-3">
            <select class="form-select w-25" name="session" id="session-select">
                @if(session == 1)
                    <option value="1" selected>Session 1: June 17 - June 27</option>
                @else
                    <option value="1">Session 1: June 17 - June 27</option>
                @endif

                @if(session == 2)
                    <option  value="2" selected>Session 2: July 8 - July 18</option>
                @else
                    <option  value="2">Session 2: July 8 - July 18</option>
                @endif

                @if(session == 3)
                    <option  value="3" selected>Session 3: July 22 - August 1</option>
                @else
                    <option  value="3">Session 3: July 22 - August 1</option>
                @endif

                @if(session == 4)
                    <option value="4" selected>Session 4: August 5 - August 15</option>
                @else
                    <option value="4">Session 4: August 5 - August 15</option>
                @endif

            </select>
            <button class="btn btn-primary" type="submit">Select</button>
        </div>

    </form>

    <table class="table table-striped">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>Level</th>
            <th>Time (1st Choice)</th>
            <th>Time (2nd Choice)</th>
            <th>Assigned Class</th>
            <th>Options</th>

        </tr>
        @for(Student student : students)
            <tr>
                <td>${student.getId()}</td>
                <td>${student.getName()}</td>
                <td>${student.getAge()}</td>
                <td>${student.getLevelName()}</td>
                <td>${student.getTime1()}</td>
                <td>${student.getTime2()}</td>
                <td>
                    @if(student.isAssigned())
                        Assigned
                    @else
                        Unassigned
                    @endif
                </td>
                <td><a href="view/${student.getId()}">View</a> |
                    <a href="/edit/${student.getId()}">Edit</a> |
                    <form action="/delete/${student.getId()}" method="get">
                        <input type="hidden" name="session" value="${student.getSession()}">
                        <button type="submit" class="btn btn-link p-0">Delete</button>
                    </form>

                </td>
            </tr>

        @endfor
    </table>
    </body>
`)
