<form method="post" action="viewdata.php">
    First Name:<input type="text" name="fname"/>
    <br>
    Last Name:<input type="text" name="lname"/>
    <br>
    Address:<input type="text" name="address"/>
    <br>
    Contact:<input type="number" name="contact"/>
    <br>
    Gender:<input type="radio" name="gender" value="Male"/>Male
    <input type="radio" name="gender" value="Female"/>Female
    <br>
    Country:
    <select name="country">
        <option name="" value=""></option>
        <option name="NPL" value="NPL">Nepal</option>
        <option name="UK" value="UK">United Kingdom</option>
    </select>
    <br>
    Description:
    <textarea name="desc">

    </textarea>
    <br>
    Email:<input type="email" name="email"/>
    <br>
    <button type="submit" name="submitbtn">Save</button>
    $str=implode(
</form>