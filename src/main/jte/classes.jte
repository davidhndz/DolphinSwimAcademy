@import cs3220.lab8.model.Student
@import cs3220.lab8.model.SwimClass
@import java.util.ArrayList

@param ArrayList<SwimClass> classes
@param int session

@template.layout(title = "Classes", content = @`
    <div class="card mb-4">
        <div class="card-body">
            <h2 class="h4 mb-3">Create Class</h2>
            <form action="/classes" method="post">
                <div class="row g-3 align-items-end">
                    <div class="col-12 col-md-4">
                        <label class="form-label" for="create-session-select">Session</label>
                        <select class="form-select" name="session" id="create-session-select">
                            @if(session == 1)
                                <option value="1" selected>Session 1: June 17 - June 27</option>
                            @else
                                <option value="1">Session 1: June 17 - June 27</option>
                            @endif
                            @if(session == 2)
                                <option value="2" selected>Session 2: July 8 - July 18</option>
                            @else
                                <option value="2">Session 2: July 8 - July 18</option>
                            @endif
                            @if(session == 3)
                                <option value="3" selected>Session 3: July 22 - August 1</option>
                            @else
                                <option value="3">Session 3: July 22 - August 1</option>
                            @endif
                            @if(session == 4)
                                <option value="4" selected>Session 4: August 5 - August 15</option>
                            @else
                                <option value="4">Session 4: August 5 - August 15</option>
                            @endif
                        </select>
                    </div>

                    <div class="col-12 col-md-3">
                        <label class="form-label" for="create-level-select">Level</label>
                        <select class="form-select" name="level" id="create-level-select">
                            <option value="1">Starfish</option>
                            <option value="2">Minnow</option>
                            <option value="3">Guppies</option>
                            <option value="4">Dolphin</option>
                        </select>
                    </div>

                    <div class="col-12 col-md-3">
                        <label class="form-label" for="create-time-select">Time</label>
                        <select class="form-select" name="time" id="create-time-select">
                            <option value="9-10am">9-10am</option>
                            <option value="10-11am">10-11am</option>
                            <option value="1-2pm">1-2pm</option>
                            <option value="2-3pm">2-3pm</option>
                        </select>
                    </div>

                    <div class="col-12 col-md-2">
                        <button class="btn btn-primary w-100" type="submit">Create</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <form action="/classes" method="get">
        <div class="d-flex flex-row gap-4 my-3">
            <select class="form-select w-25" name="session" id="session-select">
                @if(session == 1)
                    <option value="1" selected>Session 1: June 17 - June 27</option>
                @else
                    <option value="1">Session 1: June 17 - June 27</option>
                @endif

                @if(session == 2)
                    <option value="2" selected>Session 2: July 8 - July 18</option>
                @else
                    <option value="2">Session 2: July 8 - July 18</option>
                @endif

                @if(session == 3)
                    <option value="3" selected>Session 3: July 22 - August 1</option>
                @else
                    <option value="3">Session 3: July 22 - August 1</option>
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

    @if(classes.isEmpty())
        <p>No classes are scheduled for this session yet.</p>
    @else
        @for(SwimClass swimClass : classes)
            <div class="card mb-4">
                <div class="card-header">
                    <strong>Time:</strong> ${swimClass.getTime()}
                    <span class="mx-2">|</span>
                    <strong>Level:</strong> ${swimClass.getLevelName()}
                </div>
                <div class="card-body p-0">
                    <table class="table table-striped mb-0">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Age</th>
                        </tr>
                        @for(Student student : swimClass.getStudents())
                            <tr>
                                <td>${student.getId()}</td>
                                <td>${student.getName()}</td>
                                <td>${student.getAge()}</td>
                            </tr>
                        @endfor
                    </table>
                </div>
            </div>
        @endfor
    @endif
`)
