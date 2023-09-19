package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Jobs;

public class JobDao {
	private Connection con;

	public JobDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addJobs(Jobs job) {
		boolean f = false;
		try {
			String query = "INSERT INTO JOBS(JTITLE, JDES, JCAT, JSTATUS, JLOC) VALUES (?,?,?,?,?)";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, job.getTitle());
			preparedStatement.setString(2, job.getDescription());
			preparedStatement.setString(3, job.getCategory());
			preparedStatement.setString(4, job.getStatus());
			preparedStatement.setString(5, job.getLocation());

			int i = preparedStatement.executeUpdate();
			if (i == 1)
				f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Jobs> getAllJobs() {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;
		try {
			String query = "SELECT * FROM JOBS ORDER BY JID DESC";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rSet = ps.executeQuery();
			while (rSet.next()) {

				j = new Jobs();

				j.setId(rSet.getInt(1));
				j.setTitle(rSet.getString(2));
				j.setDescription(rSet.getString(3));
				j.setCategory(rSet.getString(4));
				j.setStatus(rSet.getString(5));
				j.setLocation(rSet.getString(6));
				j.setPdate(rSet.getTimestamp(7) + "");

				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Jobs getJobById(int id) {
		Jobs j = null;
		try {
			String query = "SELECT * FROM JOBS WHERE JID=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rSet = ps.executeQuery();
			if (rSet.next()) {

				j = new Jobs();

				j.setId(rSet.getInt(1));
				j.setTitle(rSet.getString(2));
				j.setDescription(rSet.getString(3));
				j.setCategory(rSet.getString(4));
				j.setStatus(rSet.getString(5));
				j.setLocation(rSet.getString(6));
				j.setPdate(rSet.getTimestamp(7) + "");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}

	public boolean editJob(Jobs job) {
		boolean f = false;
		try {
			String query = "UPDATE JOBS set JTITLE=?, JDES=?, JCAT=?, JSTATUS=?, JLOC=? WHERE JID=?";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, job.getTitle());
			preparedStatement.setString(2, job.getDescription());
			preparedStatement.setString(3, job.getCategory());
			preparedStatement.setString(4, job.getStatus());
			preparedStatement.setString(5, job.getLocation());
			preparedStatement.setInt(6, job.getId());

			int i = preparedStatement.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteJob(int id) {
		boolean f = false;
		try {
			String query = "DELETE FROM JOBS WHERE JID=?";
			PreparedStatement preparedStatement = con.prepareStatement(query);

			preparedStatement.setInt(1, id);

			int i = preparedStatement.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Jobs> getJobsForUser() {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;
		try {
			String query = "SELECT * FROM JOBS where jstatus =? ORDER BY JID DESC";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "Active");
			ResultSet rSet = ps.executeQuery();
			while (rSet.next()) {

				j = new Jobs();

				j.setId(rSet.getInt(1));
				j.setTitle(rSet.getString(2));
				j.setDescription(rSet.getString(3));
				j.setCategory(rSet.getString(4));
				j.setStatus(rSet.getString(5));
				j.setLocation(rSet.getString(6));
				j.setPdate(rSet.getTimestamp(7) + "");

				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Jobs> getJobsByCatOrLoc(String cat, String loc) {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;
		try {
			String query = "SELECT * FROM JOBS where jcat=? or jloc=? ORDER BY JID DESC";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, cat);
			ps.setString(2, loc);
			ResultSet rSet = ps.executeQuery();
			while (rSet.next()) {

				j = new Jobs();

				j.setId(rSet.getInt(1));
				j.setTitle(rSet.getString(2));
				j.setDescription(rSet.getString(3));
				j.setCategory(rSet.getString(4));
				j.setStatus(rSet.getString(5));
				j.setLocation(rSet.getString(6));
				j.setPdate(rSet.getTimestamp(7) + "");

				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Jobs> getJobsByCatAndLoc(String cat, String loc) {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;
		try {
			String query = "SELECT * FROM JOBS where jcat=? and jloc=? ORDER BY JID DESC";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, cat);
			ps.setString(2, loc);
			ResultSet rSet = ps.executeQuery();
			while (rSet.next()) {

				j = new Jobs();

				j.setId(rSet.getInt(1));
				j.setTitle(rSet.getString(2));
				j.setDescription(rSet.getString(3));
				j.setCategory(rSet.getString(4));
				j.setStatus(rSet.getString(5));
				j.setLocation(rSet.getString(6));
				j.setPdate(rSet.getTimestamp(7) + "");

				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean addJobsbyUser(Jobs job) {
		boolean f = false;
		try {
			String query = "INSERT INTO APPLIEDJOBS(JTITLE, JDES, JCAT, JSTATUS, JLOC, UID, UEMAIL, UQUAL) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, job.getTitle());
			preparedStatement.setString(2, job.getDescription());
			preparedStatement.setString(3, job.getCategory());
			preparedStatement.setString(4, job.getStatus());
			preparedStatement.setString(5, job.getLocation());
			preparedStatement.setInt(6, job.getUserId());
			preparedStatement.setString(7, job.getUserEmail());
			preparedStatement.setString(8, job.getUserQual());

			int i = preparedStatement.executeUpdate();
			if (i == 1)
				f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public List<Jobs> getAppliedJobs(int userId) {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;
		try {
			String query = "SELECT * FROM APPLIEDJOBS where UID =? ORDER BY JID DESC";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rSet = ps.executeQuery();
			while (rSet.next()) {

				j = new Jobs();

				j.setId(rSet.getInt(1));
				j.setTitle(rSet.getString(2));
				j.setDescription(rSet.getString(3));
				j.setCategory(rSet.getString(4));
				j.setStatus(rSet.getString(5));
				j.setLocation(rSet.getString(6));
				j.setPdate(rSet.getTimestamp(7) + "");

				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Jobs> getAppliedAllJobs() {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;
		try {
			String query = "SELECT * FROM APPLIEDJOBS ORDER BY JID DESC";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rSet = ps.executeQuery();
			while (rSet.next()) {

				j = new Jobs();

				j.setId(rSet.getInt(1));
				j.setTitle(rSet.getString(2));
				j.setDescription(rSet.getString(3));
				j.setCategory(rSet.getString(4));
				j.setStatus(rSet.getString(5));
				j.setLocation(rSet.getString(6));
				j.setPdate(rSet.getTimestamp(7) + "");
				j.setUserId(rSet.getInt(8));
				j.setUserEmail(rSet.getString(9));
				j.setUserQual(rSet.getString(10));

				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
