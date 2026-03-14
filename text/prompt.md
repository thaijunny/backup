import { ResponseUtil } from '../common/utils/response.util.js';
import { AppMessages } from '../common/constants/index.js';
import { plainToInstance } from 'class-transformer';
import { validate } from 'class-validator';
import { CreateEmployeeDto, UpdateEmployeeDto, EmployeeQueryDto } from '../models/dto/employees/index.js';

export class EmployeesController {
  constructor(employeesService) {
    this.employeesService = employeesService;
  }

  create = async (req, res, next) => {
    try {
      const createDto = plainToInstance(CreateEmployeeDto, req.body);

      // Validate
      const errors = await validate(createDto);
      if (errors.length > 0) {
        const message = Object.values(errors[0].constraints)[0];
        return ResponseUtil.sendResponse(res, message, null, 400);
      }

      // Handle uploaded files
      if (req.files) {
        if (req.files['frontIdCard']) {
          createDto.frontIdCardFilePath = req.files[
            'frontIdCard'
          ][0].path.replace(/\\/g, '/');
        }
        if (req.files['backIdCard']) {
          createDto.backIdCardFilePath = req.files[
            'backIdCard'
          ][0].path.replace(/\\/g, '/');
        }
      }

      const result = await this.employeesService.create(createDto);
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.Employee.CREATED,
        result,
      );
    } catch (error) {
      next(error);
    }
  };

  all = async (req, res, next) => {
    try {
      const queryDto = plainToInstance(EmployeeQueryDto, req.query);
      const result = await this.employeesService.findAll(queryDto);
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.Employee.RETRIEVED_ALL,
        result,
      );
    } catch (error) {
      next(error);
    }
  };

  findOne = async (req, res, next) => {
    try {
      const employee = await this.employeesService.findById(
        parseInt(req.params.id),
      );
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.Employee.RETRIEVED,
        employee,
      );
    } catch (error) {
      next(error);
    }
  };

  getMetadata = async (req, res, next) => {
    try {
      const metadata = await this.employeesService.getMetadata();
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.General?.RETRIEVED || 'Data retrieved successfully',
        metadata,
      );
    } catch (error) {
      next(error);
    }
  };

  list = async (req, res, next) => {
    try {
      const list = await this.employeesService.getDropdownList();
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.Employee.RETRIEVED_ALL,
        list,
      );
    } catch (error) {
      next(error);
    }
  };

  update = async (req, res, next) => {
    try {
      const updateDto = plainToInstance(UpdateEmployeeDto, req.body, {
        excludeExtraneousValues: true,
      });

      // Handle uploaded files
      if (req.files) {
        if (req.files['frontIdCard']) {
          updateDto.frontIdCardFilePath = req.files[
            'frontIdCard'
          ][0].path.replace(/\\/g, '/');
        }
        if (req.files['backIdCard']) {
          updateDto.backIdCardFilePath = req.files[
            'backIdCard'
          ][0].path.replace(/\\/g, '/');
        }
      }

      // Validate
      const errors = await validate(updateDto);
      if (errors.length > 0) {
        const message = Object.values(errors[0].constraints)[0];
        return ResponseUtil.sendResponse(res, message, null, 400);
      }

      const result = await this.employeesService.update(
        parseInt(req.params.id),
        updateDto,
      );
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.Employee.UPDATED,
        result,
      );
    } catch (error) {
      next(error);
    }
  };

  delete = async (req, res, next) => {
    try {
      await this.employeesService.delete(parseInt(req.params.id));
      ResponseUtil.sendResponse(res, AppMessages.Success.Employee.DELETED);
    } catch (error) {
      next(error);
    }
  };

  getValidationData = async (req, res, next) => {
    try {
      const data = await this.employeesService.findValidationData();
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.General?.RETRIEVED || 'Data retrieved successfully',
        data,
      );
    } catch (error) {
      next(error);
    }
  };

  export = async (req, res, next) => {
    try {
      const buffer = await this.employeesService.exportExcel();
      res.setHeader(
        'Content-Type',
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      );
      res.setHeader(
        'Content-Disposition',
        'attachment; filename=employees.xlsx',
      );
      res.setHeader('Content-Length', buffer.length);
      res.end(buffer);
    } catch (error) {
      next(error);
    }
  };

  getEmployeeNoPlanId = async (req, res, next) => {
    try {
      const result = await this.employeesService.getEmployeeNoPlanId();
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.Employee.RETRIEVED_ALL,
        result,
      );
    } catch (error) {
      next(error);
    }
  };

  getByUserId = async (req, res, next) => {
    try {
      const userId = parseInt(req.params.userId);
      const employee = await this.employeesService.getByUserId(userId);
      if (!employee) {
        return ResponseUtil.sendResponse(
          res,
          AppMessages.Errors.Employee?.NOT_FOUND?.message ||
          'Employee not found',
          null,
          404,
        );
      }
      ResponseUtil.sendResponse(
        res,
        AppMessages.Success.Employee.RETRIEVED,
        employee,
      );
    } catch (error) {
      next(error);
    }
  };
}
import { AppDataSource } from '../database/data-source.js';
import { EmployeeEntity } from '../models/entities/employee.entity.js';
import { IsNull, Between, In } from 'typeorm';

export class EmployeesRepository {
    constructor() {
        this.repository = AppDataSource.getRepository(EmployeeEntity);
    }

    async create(data) {
        const employee = this.repository.create(data);
        return this.repository.save(employee);
    }

    async findAll(options = {}) {
        const { skip = 0, take = 10, search = '', departmentId, positionId, employmentStatus } = options;
        const query = this.repository.createQueryBuilder('employee')
            .leftJoinAndSelect('employee.user', 'user')
            .leftJoinAndSelect('employee.department', 'department')
            .leftJoinAndSelect('employee.position', 'position')
            .leftJoinAndSelect('employee.jobGrade', 'jobGrade')
            .leftJoinAndSelect('employee.directManager', 'directManager')
            .leftJoinAndSelect('employee.hrMentor', 'hrMentor')
            .where('employee.isDeleted = :isDeleted', { isDeleted: false });

        if (search) {
            query.andWhere(
                '(employee.fullName LIKE :search OR employee.employeeCode LIKE :search OR employee.companyEmail LIKE :search)',
                { search: `%${search}%` }
            );
        }

        if (departmentId) {
            query.andWhere('employee.departmentId = :departmentId', { departmentId });
        }

        if (positionId) {
            query.andWhere('employee.positionId = :positionId', { positionId });
        }

        if (employmentStatus) {
            query.andWhere('employee.employmentStatus = :employmentStatus', { employmentStatus });
        }

        const [items, total] = await query
            .orderBy('employee.fullName', 'ASC')
            .skip(skip)
            .take(take)
            .getManyAndCount();

        return { items, total };
    }

    async findDropdownList(roleName) {
        const query = this.repository.createQueryBuilder('employee')
            .leftJoin('employee.user', 'user')
            .leftJoin('user.userRoles', 'userRole')
            .leftJoin('userRole.role', 'role')
            .where('employee.isDeleted = :isDeleted', { isDeleted: false });

        if (roleName) {
            query.andWhere('LOWER(role.roleName) = :roleName', { roleName: roleName.toLowerCase() });
        }

        return query
            .select(['employee.id', 'employee.fullName', 'employee.avatar'])
            .orderBy('employee.fullName', 'ASC')
            .getMany();
    }

    async findById(id) {
        return this.repository.findOne({
            where: { id, isDeleted: false },
            relations: ['user', 'department', 'position', 'jobGrade', 'directManager', 'hrMentor']
        });
    }

    async findByIds(ids) {
        if (!ids || ids.length === 0) return [];
        return this.repository.find({
            where: {
                id: In(ids),
                isDeleted: false
            },
            relations: ['user', 'department']
        });
    }

    async update(id, data) {
        await this.repository.update(id, data);
        return this.findById(id);
    }

    async softDelete(id) {
        return this.repository.update(id, {
            isDeleted: true,
            deletedAt: new Date()
        });
    }

    async findByField(field, value, excludeId = null) {
        const query = this.repository.createQueryBuilder('employee')
            .where(`employee.${field} = :value`, { value })
            .andWhere('employee.isDeleted = :isDeleted', { isDeleted: false });

        if (excludeId) {
            query.andWhere('employee.id != :excludeId', { excludeId });
        }

        return query.getOne();
    }
    async findValidationData() {
        return this.repository.find({
            where: { isDeleted: false },
            select: ['id', 'employeeCode', 'fullName', 'personalEmail', 'companyEmail', 'phoneNumber', 'nationalId']
        });
    }

    async getEmployeeNoPlanId() {
        return this.repository.find({
            where: {
                isDeleted: false,
                planId: IsNull(),
            },
            relations: [
                'user',
                'department',
                'position',
                'jobGrade',
                'directManager',
                'hrMentor',
            ],
        });
    }

    async getByUserId(userId) {
        return this.repository.findOne({
            where: {
                isDeleted: false,
                userId: userId,
            },
            relations: [
                'user',
                'department',
                'position',
                'jobGrade',
                'directManager',
                'hrMentor',
            ],
        });
    }

    async count() {
        return this.repository.count({ where: { isDeleted: false } });
    }

    async countByCreatedAtRange(start, end) {
        return this.repository.count({
            where: {
                isDeleted: false,
                createdAt: Between(start, end),
            },
        });
    }
}
import { AppMessages } from '../common/constants/index.js';
import {
  NotFoundException,
  ConflictException,
} from '../common/exceptions/index.js';
import { AppDataSource } from '../database/data-source.js';
import { PositionEntity } from '../models/entities/position.entity.js';
import { JobGradeEntity } from '../models/entities/job-grade.entity.js';
import { DepartmentsRepository } from '../repositories/departments.repository.js';
import { UserEntity } from '../models/entities/user.entity.js';
import { RoleEntity } from '../models/entities/role.entity.js';
import { UserRoleEntity } from '../models/entities/user-role.entity.js';
import { hashPassword } from '../common/utils/index.js';
import { ExcelUtil } from '../common/utils/excel.util.js';
import { mailService } from './mail.service.js';
import crypto from 'crypto';

const generateRandomPassword = () => {
  return crypto.randomBytes(6).toString('base64').slice(0, 10) + 'A1!';
};

export class EmployeesService {
  constructor(employeesRepository) {
    this.employeesRepository = employeesRepository;
  }

  async findAll(queryDto) {
    const result = await this.employeesRepository.findAll(queryDto);
    return {
      ...result,
      page: queryDto.page,
      limit: queryDto.limit,
      totalPages: Math.ceil(result.total / queryDto.limit),
    };
  }

  async create(createDto) {
    // Check employeeCode uniqueness
    if (createDto.employeeCode) {
      const existingCode = await this.employeesRepository.findByField(
        'employeeCode',
        createDto.employeeCode,
      );
      if (existingCode) {
        throw new ConflictException(
          AppMessages.Errors.Employee.CODE_DUPLICATE,
        );
      }
    }

    if (createDto.personalEmail) {
      const existing = await this.employeesRepository.findByField(
        'personalEmail',
        createDto.personalEmail,
      );
      if (existing) {
        throw new ConflictException(
          AppMessages.Errors.Employee.EMAIL_DUPLICATE,
        );
      }
    }

    if (createDto.phoneNumber) {
      const existing = await this.employeesRepository.findByField(
        'phoneNumber',
        createDto.phoneNumber,
      );
      if (existing) {
        throw new ConflictException(
          AppMessages.Errors.Employee.PHONE_DUPLICATE,
        );
      }
    }

    if (createDto.nationalId) {
      const existing = await this.employeesRepository.findByField(
        'nationalId',
        createDto.nationalId,
      );
      if (existing) {
        throw new ConflictException(
          AppMessages.Errors.Employee.NATIONAL_ID_DUPLICATE,
        );
      }
    }

    // Handle User Account Creation
    if (createDto.companyEmail) {
      const userRepo = AppDataSource.getRepository(UserEntity);
      const roleRepo = AppDataSource.getRepository(RoleEntity);
      const userRoleRepo = AppDataSource.getRepository(UserRoleEntity);

      // Check if user already exists
      let user = await userRepo.findOne({
        where: { email: createDto.companyEmail },
      });

      if (!user) {
        const randomPassword = generateRandomPassword();
        const password = await hashPassword(randomPassword);
        user = userRepo.create({
          username: createDto.companyEmail.split('@')[0],
          email: createDto.companyEmail,
          password: password,
          status: 'ACTIVE',
        });
        await userRepo.save(user);

        // Assign default role (EMPLOYEE)
        const role = await roleRepo.findOne({
          where: { roleName: 'EMPLOYEE' },
        });
        if (role) {
          const userRole = userRoleRepo.create({
            userId: user.id,
            roleId: role.id,
          });
          await userRoleRepo.save(userRole);
        }

        // Send email notification with random password
        await mailService.sendAccountInfo(
          user.email,
          createDto.fullName,
          user.username,
          randomPassword,
        );
      }
      createDto.userId = user.id;
    }

    return this.employeesRepository.create(createDto);
  }

  async getMetadata() {
    const deptRepo = new DepartmentsRepository();
    const positions = await AppDataSource.getRepository(PositionEntity).find({
      where: { isDeleted: false },
      order: { positionName: 'ASC' },
    });
    const jobGrades = await AppDataSource.getRepository(JobGradeEntity).find({
      where: { isDeleted: false },
      order: { gradeName: 'ASC' },
    });
    const departments = await deptRepo.findList();
    const managers = await this.getDropdownList('MANAGER');
    const hrMentors = await this.getDropdownList('HR');

    return {
      departments,
      positions,
      jobGrades,
      managers,
      hrMentors,
      genderOptions: [
        { value: 'MALE', label: 'Nam' },
        { value: 'FEMALE', label: 'Nữ' },
        { value: 'OTHER', label: 'Khác' },
      ],
      maritalStatusOptions: [
        { value: 'SINGLE', label: 'Độc thân' },
        { value: 'MARRIED', label: 'Đã kết hôn' },
        { value: 'DIVORCED', label: 'Đã ly hôn' },
        { value: 'WIDOWED', label: 'Góa vụ' },
      ],
      employmentStatusOptions: [
        { value: 'PROBATION', label: 'Thử việc' },
        { value: 'ACTIVE', label: 'Đang làm việc' },
        { value: 'ON_LEAVE', label: 'Nghỉ phép' },
        { value: 'TERMINATED', label: 'Đã nghỉ việc' },
      ],
    };
  }

  async getDropdownList(roleName) {
    return this.employeesRepository.findDropdownList(roleName);
  }

  async findById(id) {
    const employee = await this.employeesRepository.findById(id);
    if (!employee) {
      throw new NotFoundException(AppMessages.Errors.Employee.NOT_FOUND);
    }
    return employee;
  }

  async update(id, updateDto) {
    const employee = await this.findById(id);

    if (updateDto.personalEmail) {
      const existing = await this.employeesRepository.findByField(
        'personalEmail',
        updateDto.personalEmail,
        id,
      );
      if (existing) {
        throw new ConflictException(
          AppMessages.Errors.Employee.EMAIL_DUPLICATE,
        );
      }
    }

    if (updateDto.phoneNumber) {
      const existing = await this.employeesRepository.findByField(
        'phoneNumber',
        updateDto.phoneNumber,
        id,
      );
      if (existing) {
        throw new ConflictException(
          AppMessages.Errors.Employee.PHONE_DUPLICATE,
        );
      }
    }

    if (updateDto.nationalId) {
      const existing = await this.employeesRepository.findByField(
        'nationalId',
        updateDto.nationalId,
        id,
      );
      if (existing) {
        throw new ConflictException(
          AppMessages.Errors.Employee.NATIONAL_ID_DUPLICATE,
        );
      }
    }

    return this.employeesRepository.update(employee.id, updateDto);
  }

  async delete(id) {
    const employee = await this.findById(id);
    return this.employeesRepository.softDelete(employee.id);
  }

  async findValidationData() {
    return this.employeesRepository.findValidationData();
  }

  async exportExcel() {
    const { items } = await this.employeesRepository.findAll({
      limit: 10000,
      page: 1,
    });

    const statusLabels = {
      PROBATION: 'Thử việc',
      ACTIVE: 'Đang làm việc',
      ON_LEAVE: 'Nghỉ phép',
      TERMINATED: 'Đã nghỉ việc',
    };

    const maritalStatusLabels = {
      SINGLE: 'Độc thân',
      MARRIED: 'Đã kết hôn',
      DIVORCED: 'Đã ly hôn',
      WIDOWED: 'Góa phụ/Góa chồng',
    };

    const genderLabels = {
      MALE: 'Nam',
      FEMALE: 'Nữ',
      OTHER: 'Khác',
    };

    const data = items.map((e, index) => ({
      index: index + 1,
      employeeCode: e.employeeCode || '',
      fullName: e.fullName,
      gender: genderLabels[e.gender] || e.gender,
      dateOfBirth: e.dateOfBirth
        ? new Date(e.dateOfBirth).toLocaleDateString('vi-VN')
        : '',
      nationalId: e.nationalId || '',
      nationalIdIssuedDate: e.nationalIdIssuedDate
        ? new Date(e.nationalIdIssuedDate).toLocaleDateString('vi-VN')
        : '',
      nationalIdIssuedPlace: e.nationalIdIssuedPlace || '',
      nationality: e.nationality || '',
      maritalStatus: maritalStatusLabels[e.maritalStatus] || e.maritalStatus,
      taxCode: e.taxCode || '',
      companyEmail: e.companyEmail || '',
      personalEmail: e.personalEmail || '',
      phoneNumber: e.phoneNumber || '',
      educationLevel: e.educationLevel || '',
      currentAddress: e.currentAddress || '',
      permanentAddress: e.permanentAddress || '',
      department: e.department?.departmentName || '',
      position: e.position?.positionName || '',
      jobGrade: e.jobGrade?.gradeName || '',
      directManager: e.directManager?.fullName || '',
      hrMentor: e.hrMentor?.fullName || '',
      joinDate: e.joinDate
        ? new Date(e.joinDate).toLocaleDateString('vi-VN')
        : '',
      officialStartDate: e.officialStartDate
        ? new Date(e.officialStartDate).toLocaleDateString('vi-VN')
        : '',
      status: statusLabels[e.employmentStatus] || e.employmentStatus,
    }));

    const columns = [
      { header: 'STT', key: 'index', width: 8 },
      { header: 'Mã nhân viên', key: 'employeeCode', width: 15 },
      { header: 'Họ và tên', key: 'fullName', width: 25 },
      { header: 'Giới tính', key: 'gender', width: 12 },
      { header: 'Ngày sinh', key: 'dateOfBirth', width: 15 },
      { header: 'Số CMND/CCCD', key: 'nationalId', width: 15 },
      { header: 'Ngày cấp', key: 'nationalIdIssuedDate', width: 15 },
      { header: 'Nơi cấp', key: 'nationalIdIssuedPlace', width: 20 },
      { header: 'Quốc tịch', key: 'nationality', width: 15 },
      { header: 'Tình trạng hôn nhân', key: 'maritalStatus', width: 20 },
      { header: 'Mã số thuế', key: 'taxCode', width: 15 },
      { header: 'Email công ty', key: 'companyEmail', width: 25 },
      { header: 'Email cá nhân', key: 'personalEmail', width: 25 },
      { header: 'Số điện thoại', key: 'phoneNumber', width: 15 },
      { header: 'Trình độ học vấn', key: 'educationLevel', width: 20 },
      { header: 'Địa chỉ hiện tại', key: 'currentAddress', width: 30 },
      { header: 'Địa chỉ thường trú', key: 'permanentAddress', width: 30 },
      { header: 'Phòng ban', key: 'department', width: 20 },
      { header: 'Chức vụ', key: 'position', width: 20 },
      { header: 'Cấp bậc', key: 'jobGrade', width: 15 },
      { header: 'Quản lý trực tiếp', key: 'directManager', width: 25 },
      { header: 'Người hướng dẫn HR', key: 'hrMentor', width: 25 },
      { header: 'Ngày vào làm', key: 'joinDate', width: 15 },
      { header: 'Ngày chính thức', key: 'officialStartDate', width: 15 },
      { header: 'Trạng thái', key: 'status', width: 15 },
    ];

    return ExcelUtil.export(data, columns, 'Danh sách nhân viên');
  }

  async getEmployeeNoPlanId() {
    return this.employeesRepository.getEmployeeNoPlanId();
  }

  async getByUserId(userId) {
    return this.employeesRepository.getByUserId(userId);
  }
}"use client";

import { Modal } from "@/components/common/Modal";
import { User, Building2, Briefcase, Calendar, Mail, Phone, MapPin, FileText, Image } from "lucide-react";

const BACKEND_URL = "http://localhost:3000";

const InfoItem = ({ icon: Icon, label, value }) => (
    <div className="flex items-start gap-3 py-2">
        <Icon className="h-4 w-4 text-slate-400 mt-0.5" />
        <div className="flex-1 min-w-0">
            <p className="text-xs text-slate-500">{label}</p>
            <p className="text-sm font-medium text-slate-900 truncate">{value || "-"}</p>
        </div>
    </div>
);

const Section = ({ title, children }) => (
    <div className="border-b border-slate-100 pb-4 last:border-0 last:pb-0">
        <h3 className="text-sm font-semibold text-slate-700 mb-3">{title}</h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-1">
            {children}
        </div>
    </div>
);

const ImagePreview = ({ src, label }) => {
    if (!src) return null;
    const fullSrc = src.startsWith('http') ? src : `${BACKEND_URL}/${src}`;
    return (
        <div className="space-y-1">
            <p className="text-xs text-slate-500 flex items-center gap-1">
                <Image className="h-3 w-3" /> {label}
            </p>
            <div className="h-32 rounded-lg border border-slate-200 overflow-hidden bg-slate-50">
                <img src={fullSrc} alt={label} className="h-full w-full object-contain" />
            </div>
        </div>
    );
};

const statusColors = {
    ACTIVE: "bg-emerald-50 text-emerald-700 border-emerald-200",
    PROBATION: "bg-amber-50 text-amber-700 border-amber-200",
    ON_LEAVE: "bg-blue-50 text-blue-700 border-blue-200",
    TERMINATED: "bg-rose-50 text-rose-700 border-rose-200",
};

const statusLabels = {
    ACTIVE: "Đang làm việc",
    PROBATION: "Thử việc",
    ON_LEAVE: "Nghỉ phép",
    TERMINATED: "Đã nghỉ",
};

const genderLabels = { MALE: "Nam", FEMALE: "Nữ", OTHER: "Khác" };
const maritalLabels = { SINGLE: "Độc thân", MARRIED: "Đã kết hôn", DIVORCED: "Đã ly hôn", WIDOWED: "Góa" };

const formatDate = (dateStr) => {
    if (!dateStr) return "-";
    return new Date(dateStr).toLocaleDateString("vi-VN");
};

export default function EmployeeDetailModal({ isOpen, onClose, employee }) {
    if (!employee) return null;

    const status = employee.employmentStatus;

    return (
        <Modal isOpen={isOpen} onClose={onClose} title="Chi tiết nhân viên" size="xl">
            <div className="max-h-[80vh] overflow-y-auto px-2 space-y-6">
                {/* Header Section in modal body for better layout */}
                <div className="flex items-center gap-4 pb-4 border-b border-slate-200">
                    <div className="h-16 w-16 rounded-full bg-slate-100 flex items-center justify-center overflow-hidden border border-slate-200">
                        {employee.avatar ? (
                            <img
                                src={employee.avatar.startsWith('http') ? employee.avatar : `${BACKEND_URL}/${employee.avatar}`}
                                alt={employee.fullName}
                                className="h-full w-full object-cover"
                            />
                        ) : (
                            <User className="h-8 w-8 text-slate-400" />
                        )}
                    </div>
                    <div className="flex-1">
                        <div className="flex items-center gap-2">
                            <h2 className="text-xl font-bold text-slate-900">{employee.fullName}</h2>
                            <span className={`px-2 py-0.5 text-xs font-medium rounded-full border ${statusColors[status] || "bg-slate-100"}`}>
                                {statusLabels[status] || status}
                            </span>
                        </div>
                        <p className="text-sm text-indigo-600 font-mono">{employee.employeeCode || "-"}</p>
                        <p className="text-sm text-slate-500">{employee.position?.positionName || "-"} • {employee.department?.departmentName || "-"}</p>
                    </div>
                </div>

                {/* Personal Info */}
                <Section title="Thông tin cá nhân">
                    <InfoItem icon={Calendar} label="Ngày sinh" value={formatDate(employee.dateOfBirth)} />
                    <InfoItem icon={User} label="Giới tính" value={genderLabels[employee.gender]} />
                    <InfoItem icon={User} label="Tình trạng hôn nhân" value={maritalLabels[employee.maritalStatus]} />
                    <InfoItem icon={FileText} label="Quốc tịch" value={employee.nationality} />
                    <InfoItem icon={FileText} label="Số CCCD/CMND" value={employee.nationalId} />
                    <InfoItem icon={Calendar} label="Ngày cấp" value={formatDate(employee.nationalIdIssuedDate)} />
                    <InfoItem icon={MapPin} label="Nơi cấp" value={employee.nationalIdIssuedPlace} />
                    <InfoItem icon={FileText} label="Mã số thuế" value={employee.taxCode} />
                </Section>

                {/* Contact */}
                <Section title="Thông tin liên hệ">
                    <InfoItem icon={Mail} label="Email công ty" value={employee.companyEmail} />
                    <InfoItem icon={Mail} label="Email cá nhân" value={employee.personalEmail} />
                    <InfoItem icon={Phone} label="Số điện thoại" value={employee.phoneNumber} />
                    <InfoItem icon={MapPin} label="Địa chỉ thường trú" value={employee.permanentAddress} />
                    <InfoItem icon={MapPin} label="Địa chỉ tạm trú" value={employee.currentAddress} />
                </Section>

                {/* Employment */}
                <Section title="Thông tin công việc">
                    <InfoItem icon={Building2} label="Phòng ban" value={employee.department?.departmentName} />
                    <InfoItem icon={Briefcase} label="Chức vụ" value={employee.position?.positionName} />
                    <InfoItem icon={Briefcase} label="Cấp bậc" value={employee.jobGrade?.gradeName} />
                    <InfoItem icon={User} label="Quản lý trực tiếp" value={employee.directManager?.fullName} />
                    <InfoItem icon={User} label="HR Mentor" value={employee.hrMentor?.fullName} />
                    <InfoItem icon={Calendar} label="Ngày vào làm" value={formatDate(employee.joinDate)} />
                    <InfoItem icon={Calendar} label="Ngày chính thức" value={formatDate(employee.officialStartDate)} />
                </Section>

                {/* ID Card Images */}
                {(employee.frontIdCardFilePath || employee.backIdCardFilePath) && (
                    <Section title="Ảnh giấy tờ">
                        <ImagePreview src={employee.frontIdCardFilePath} label="CCCD mặt trước" />
                        <ImagePreview src={employee.backIdCardFilePath} label="CCCD mặt sau" />
                    </Section>
                )}
            </div>
        </Modal>
    );
}
"use client";

import { useEffect } from "react";
import { Button } from "@/components/common/Button";
import { Input } from "@/components/common/Input";
import { Label } from "@/components/common/Label";
import { Select } from "@/components/common/Select";
import { Modal } from "@/components/common/Modal";
import { Image } from "lucide-react";

const BACKEND_URL = "http://localhost:3000";

const FilePreview = ({ file, existingPath, label }) => {
    if (!file && !existingPath) return null;

    const previewUrl = file
        ? URL.createObjectURL(file)
        : (existingPath?.startsWith('http') ? existingPath : `${BACKEND_URL}/${existingPath}`);

    return (
        <div className="mt-2 relative group">
            <div className="text-xs text-slate-500 mb-1 flex items-center gap-1">
                <Image className="h-3 w-3" /> Xem trước {label}
            </div>
            <div className="h-40 w-full rounded-lg border border-slate-200 overflow-hidden bg-slate-50 flex items-center justify-center">
                <img
                    src={previewUrl}
                    alt={label}
                    className="h-full w-full object-contain transition-transform duration-300 group-hover:scale-105"
                    onLoad={() => {
                        if (file) URL.revokeObjectURL(previewUrl);
                    }}
                />
            </div>
        </div>
    );
};

export default function EmployeeFormModal({
    isOpen,
    onClose,
    onSubmit,
    formData,
    onFormChange,
    metadata = {},
    loading,
    errors = {},
    mode = "create",
}) {
    const isEdit = mode === "edit";
    const title = isEdit ? "Cập nhật hồ sơ nhân viên" : "Thêm nhân viên mới";
    const submitText = isEdit ? "Lưu thay đổi" : "Tạo mới";

    const sections = [
        {
            title: "Thông tin cá nhân",
            fields: [
                { id: "employeeCode", label: "Mã nhân viên *", type: "text", placeholder: "Ví dụ: NV-001", disabled: isEdit },
                { id: "fullName", label: "Họ và tên *", type: "text", placeholder: "Nhập họ và tên" },
                { id: "dateOfBirth", label: "Ngày sinh", type: "date" },
                { id: "gender", label: "Giới tính", type: "select", options: metadata.genderOptions },
                { id: "nationality", label: "Quốc tịch", type: "text", placeholder: "Ví dụ: Việt Nam" },
                { id: "maritalStatus", label: "Tình trạng hôn nhân", type: "select", options: metadata.maritalStatusOptions },
            ]
        },
        {
            title: "Giấy tờ định danh & Thuế",
            fields: [
                { id: "nationalId", label: "Số CCCD/CMND", type: "text", placeholder: "Số định danh" },
                { id: "nationalIdIssuedDate", label: "Ngày cấp", type: "date" },
                { id: "nationalIdIssuedPlace", label: "Nơi cấp", type: "text", placeholder: "Nơi cấp" },
                { id: "taxCode", label: "Mã số thuế", type: "text", placeholder: "Mã số thuế cá nhân" },
                { id: "frontIdCard", label: "Ảnh CCCD mặt trước", type: "file", placeholder: "Chọn ảnh mặt trước" },
                { id: "backIdCard", label: "Ảnh CCCD mặt sau", type: "file", placeholder: "Chọn ảnh mặt sau" },
            ]
        },
        {
            title: "Liên hệ & Địa chỉ",
            fields: [
                { id: "phoneNumber", label: "Số điện thoại", type: "text", placeholder: "Số điện thoại liên hệ" },
                { id: "personalEmail", label: "Email cá nhân", type: "email", placeholder: "example@gmail.com", disabled: isEdit },
                { id: "companyEmail", label: "Email công ty", type: "email", placeholder: "name@company.com", disabled: isEdit },
                { id: "permanentAddress", label: "Địa chỉ thường trú", type: "text", placeholder: "Địa chỉ trên hộ khẩu" },
                { id: "currentAddress", label: "Địa chỉ tạm trú", type: "text", placeholder: "Địa chỉ hiện tại" },
            ]
        },
        {
            title: "Thông tin công việc",
            fields: [
                {
                    id: "departmentId",
                    label: "Phòng ban",
                    type: "select",
                    options: metadata.departments?.map(d => ({ value: d.id, label: d.departmentName }))
                },
                {
                    id: "positionId",
                    label: "Chức vụ",
                    type: "select",
                    options: metadata.positions?.map(p => ({ value: p.id, label: p.positionName }))
                },
                {
                    id: "jobGradeId",
                    label: "Cấp bậc",
                    type: "select",
                    options: metadata.jobGrades?.map(j => ({ value: j.id, label: j.gradeName }))
                },
                { id: "employmentStatus", label: "Trạng thái nhân sự", type: "select", options: metadata.employmentStatusOptions },
                { id: "educationLevel", label: "Trình độ học vấn", type: "text", placeholder: "Ví dụ: Đại học" },
                { id: "joinDate", label: "Ngày gia nhập", type: "date" },
                { id: "officialStartDate", label: "Ngày chính thức", type: "date" },
                {
                    id: "directManagerId",
                    label: "Quản lý trực tiếp",
                    type: "select",
                    options: metadata.managers?.map(m => ({ value: m.id, label: m.fullName }))
                },
                {
                    id: "hrMentorId",
                    label: "HR Mentor",
                    type: "select",
                    options: metadata.hrMentors?.map(m => ({ value: m.id, label: m.fullName }))
                },
            ]
        }
    ];

    const handleChange = (id, value) => {
        onFormChange({ ...formData, [id]: value });
    };

    return (
        <Modal isOpen={isOpen} onClose={onClose} title={title} size="xl">
            <div className="max-h-[70vh] overflow-y-auto px-1 pr-3 custom-scrollbar">
                <div className="space-y-8 pb-4">
                    {sections.map((section, idx) => (
                        <div key={idx} className="space-y-4">
                            <h3 className="text-sm font-semibold text-indigo-600 uppercase tracking-wider border-b border-indigo-100 pb-1">
                                {section.title}
                            </h3>
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                {section.fields.map((field) => (
                                    <div key={field.id} className="space-y-1.5">
                                        <Label htmlFor={field.id}>{field.label}</Label>
                                        {field.type === "select" ? (
                                            <Select
                                                id={field.id}
                                                value={formData[field.id] || ""}
                                                onChange={(e) => handleChange(field.id, e.target.value)}
                                                options={field.options || []}
                                                placeholder={`-- Chọn ${field.label.replace(' *', '')} --`}
                                                error={errors[field.id]}
                                            />
                                        ) : field.type === "file" ? (
                                            <div className="space-y-2">
                                                <Input
                                                    id={field.id}
                                                    type="file"
                                                    accept="image/*"
                                                    onChange={(e) => handleChange(field.id, e.target.files[0])}
                                                    error={errors[field.id]}
                                                />
                                                <FilePreview
                                                    file={formData[field.id] instanceof File ? formData[field.id] : null}
                                                    existingPath={typeof formData[field.id] === 'string' ? formData[field.id] : (isEdit ? formData[`${field.id}FilePath`] : null)}
                                                    label={field.label}
                                                />
                                            </div>
                                        ) : (
                                            <Input
                                                id={field.id}
                                                type={field.type}
                                                value={formData[field.id] || ""}
                                                onChange={(e) => handleChange(field.id, e.target.value)}
                                                placeholder={field.placeholder}
                                                error={errors[field.id]}
                                                disabled={field.disabled}
                                            />
                                        )}
                                    </div>
                                ))}
                            </div>
                        </div>
                    ))}
                </div>
            </div>
            <div className="flex justify-end gap-3 pt-6 mt-4 border-t border-slate-100">
                <Button variant="outline" onClick={onClose}>
                    Hủy
                </Button>
                <Button onClick={onSubmit} loading={loading} className="min-w-[100px]">
                    {submitText}
                </Button>
            </div>
        </Modal>
    );
}"use client";

import { useMemo } from "react";
import {
  useReactTable,
  getCoreRowModel,
  getPaginationRowModel,
  flexRender,
} from "@tanstack/react-table";
import { Button } from "@/components/common/Button";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/common/Card";
import { Input } from "@/components/common/Input";
import { Skeleton } from "@/components/common/Skeleton";
import { Pagination } from "@/components/common/Pagination";
import { Search, Edit2, Trash2, User, Eye } from "lucide-react";

const BACKEND_URL = "http://localhost:3000";

export default function EmployeeTable({
  data,
  loading,
  search,
  onSearchChange,
  pagination,
  onPaginationChange,
  totalPages,
  onEdit,
  onDelete,
  onViewDetail,
}) {
  const columns = useMemo(
    () => [
      {
        id: "stt",
        header: "STT",
        size: 60,
        cell: ({ row }) => (
          <span className="text-slate-500">
            {pagination.pageIndex * pagination.pageSize + row.index + 1}
          </span>
        ),
      },
      {
        accessorKey: "employeeCode",
        header: "Mã NV",
        size: 100,
        cell: ({ row }) => (
          <span className="font-mono text-sm text-indigo-600">
            {row.original.employeeCode || "-"}
          </span>
        ),
      },
      {
        accessorKey: "avatar",
        header: "Ảnh",
        size: 60,
        cell: ({ row }) => (
          <div className="h-9 w-9 rounded-full bg-slate-100 flex items-center justify-center overflow-hidden border border-slate-200">
            {row.original.avatar ? (
              <img
                src={
                  row.original.avatar.startsWith("http")
                    ? row.original.avatar
                    : `${BACKEND_URL}/${row.original.avatar}`
                }
                alt={row.original.fullName}
                className="h-full w-full object-cover"
                onError={(e) => {
                  e.target.onerror = null;
                  e.target.src = ""; // Fallback will show the User icon
                }}
              />
            ) : (
              <User className="h-5 w-5 text-slate-400" />
            )}
          </div>
        ),
      },
      {
        accessorKey: "fullName",
        header: "Họ và tên",
        cell: ({ row }) => (
          <div>
            <div className="font-medium text-slate-900">
              {row.original.fullName}
            </div>
            <div className="text-xs text-slate-500">
              {row.original.companyEmail || row.original.personalEmail}
            </div>
          </div>
        ),
      },
      {
        accessorKey: "department",
        header: "Phòng ban",
        cell: ({ row }) => row.original.department?.departmentName || "-",
      },
      {
        accessorKey: "position",
        header: "Chức vụ",
        cell: ({ row }) => row.original.position?.positionName || "-",
      },
      {
        accessorKey: "employmentStatus",
        header: "Trạng thái",
        cell: ({ row }) => {
          const status = row.original.employmentStatus;
          const colors = {
            ACTIVE: "bg-emerald-50 text-emerald-700 border-emerald-200",
            PROBATION: "bg-amber-50 text-amber-700 border-amber-200",
            ON_LEAVE: "bg-blue-50 text-blue-700 border-blue-200",
            TERMINATED: "bg-rose-50 text-rose-700 border-rose-200",
          };
          const labels = {
            ACTIVE: "Hoạt động",
            PROBATION: "Thử việc",
            ON_LEAVE: "Nghỉ phép",
            TERMINATED: "Đã nghỉ",
          };
          return (
            <span
              className={`px-2 py-1 rounded-full text-xs font-medium border ${colors[status] || "bg-slate-50 text-slate-700 border-slate-200"}`}
            >
              {labels[status] || status}
            </span>
          );
        },
      },
      {
        id: "actions",
        header: "Thao tác",
        size: 140,
        cell: ({ row }) => (
          <div className="flex items-center gap-1">
            <Button
              variant="ghost"
              size="icon"
              onClick={() => onViewDetail(row.original)}
              title="Xem chi tiết"
            >
              <Eye className="h-4 w-4 text-slate-500" />
            </Button>
            <Button
              variant="ghost"
              size="icon"
              onClick={() => onEdit(row.original)}
              title="Chỉnh sửa"
            >
              <Edit2 className="h-4 w-4 text-blue-500" />
            </Button>
            <Button
              variant="ghost"
              size="icon"
              onClick={() => onDelete(row.original)}
              title="Xóa"
            >
              <Trash2 className="h-4 w-4 text-red-500" />
            </Button>
          </div>
        ),
      },
    ],
    [onEdit, onDelete, onViewDetail, pagination],
  );

  const table = useReactTable({
    data,
    columns,
    pageCount: totalPages,
    state: { pagination },
    onPaginationChange,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    manualPagination: true,
  });

  return (
    <Card>
      <CardHeader className="border-b border-slate-200">
        <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <CardTitle>Danh sách nhân viên</CardTitle>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-400" />
            <Input
              placeholder="Tìm kiếm..."
              value={search}
              onChange={(e) => onSearchChange(e.target.value)}
              className="pl-9 w-full sm:w-64"
            />
          </div>
        </div>
      </CardHeader>
      <CardContent className="p-0">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="border-b border-slate-200 bg-slate-50">
              {table.getHeaderGroups().map((headerGroup) => (
                <tr key={headerGroup.id}>
                  {headerGroup.headers.map((header) => (
                    <th
                      key={header.id}
                      className="px-4 py-3 text-left text-sm font-medium text-slate-600"
                      style={{ width: header.getSize() }}
                    >
                      {flexRender(
                        header.column.columnDef.header,
                        header.getContext(),
                      )}
                    </th>
                  ))}
                </tr>
              ))}
            </thead>
            <tbody>
              {loading ? (
                Array.from({ length: 5 }).map((_, i) => (
                  <tr key={i} className="border-b border-slate-200">
                    {columns.map((_, j) => (
                      <td key={j} className="px-4 py-3">
                        <Skeleton className="h-5 w-full" />
                      </td>
                    ))}
                  </tr>
                ))
              ) : table.getRowModel().rows.length === 0 ? (
                <tr>
                  <td
                    colSpan={columns.length}
                    className="px-4 py-8 text-center text-slate-500"
                  >
                    Không có dữ liệu
                  </td>
                </tr>
              ) : (
                table.getRowModel().rows.map((row) => (
                  <tr
                    key={row.id}
                    className="border-b border-slate-200 hover:bg-slate-50 transition-colors"
                  >
                    {row.getVisibleCells().map((cell) => (
                      <td
                        key={cell.id}
                        className="px-4 py-3 text-sm text-slate-700"
                      >
                        {flexRender(
                          cell.column.columnDef.cell,
                          cell.getContext(),
                        )}
                      </td>
                    ))}
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
        <div className="flex items-center justify-between border-t border-slate-200 px-4 py-3">
          <p className="text-sm text-slate-500">
            Hiển thị {data.length} / Trang {pagination.pageIndex + 1} của{" "}
            {totalPages}
          </p>
          <Pagination
            currentPage={pagination.pageIndex + 1}
            totalPages={totalPages}
            onPageChange={(page) =>
              onPaginationChange({ ...pagination, pageIndex: page - 1 })
            }
          />
        </div>
      </CardContent>
    </Card>
  );
}"use client";

import { useState, useEffect, useCallback } from "react";
import { Plus, Download, Users } from "lucide-react";
import { Button } from "@/components/common/Button";
import { PageTitle } from "@/components/common/PageTitle";
import { useToast } from "@/components/common/Toast";
import { employeesService } from "@/services";
import { validate, required, email, uniqueField, regex } from "@/lib/validation";
import { Select } from "@/components/common/Select";

// Local components
import EmployeeTable from "./components/EmployeeTable";
import EmployeeFormModal from "./components/EmployeeFormModal";
import EmployeeDeleteModal from "./components/EmployeeDeleteModal";
import EmployeeDetailModal from "./components/EmployeeDetailModal";

export default function EmployeesPage() {
    const { success, error: toastError } = useToast();

    // Data state
    const [employees, setEmployees] = useState([]);
    const [metadata, setMetadata] = useState({});
    const [validationData, setValidationData] = useState([]);
    const [loading, setLoading] = useState(true);
    const [exportLoading, setExportLoading] = useState(false);
    const [totalPages, setTotalPages] = useState(0);

    // UI state
    const [search, setSearch] = useState("");
    const [filters, setFilters] = useState({
        departmentId: "",
        positionId: "",
        employmentStatus: "",
    });
    const [pagination, setPagination] = useState({ pageIndex: 0, pageSize: 10 });
    const [isFormOpen, setIsFormOpen] = useState(false);
    const [isDeleteOpen, setIsDeleteOpen] = useState(false);
    const [isDetailOpen, setIsDetailOpen] = useState(false);
    const [modalMode, setModalMode] = useState("create");
    const [submitting, setSubmitting] = useState(false);

    // Form state
    const [selectedEmployee, setSelectedEmployee] = useState(null);
    const [formData, setFormData] = useState({});
    const [errors, setErrors] = useState({});

    const fetchMetadata = async () => {
        try {
            const [metaRes, validRes] = await Promise.all([
                employeesService.getMetadata(),
                employeesService.getValidationData()
            ]);
            setMetadata(metaRes.data || {});
            setValidationData(validRes.data || []);
        } catch (error) {
            toastError("Không thể tải dữ liệu cấu hình");
        }
    };

    const fetchEmployees = useCallback(async () => {
        setLoading(true);
        try {
            const result = await employeesService.getAll({
                page: pagination.pageIndex + 1,
                limit: pagination.pageSize,
                search: search,
                departmentId: filters.departmentId || undefined,
                positionId: filters.positionId || undefined,
                employmentStatus: filters.employmentStatus || undefined,
            });
            const data = result.data || {};
            setEmployees(data.items || []);
            setTotalPages(data.totalPages || 0);
        } catch (error) {
            toastError("Không thể tải danh sách nhân viên");
        } finally {
            setLoading(false);
        }
    }, [pagination, search, filters, toastError]);

    useEffect(() => {
        fetchMetadata();
    }, []);

    useEffect(() => {
        fetchEmployees();
    }, [fetchEmployees]);

    const handleCreate = () => {
        setSelectedEmployee(null);
        setFormData({
            employeeCode: "",
            employmentStatus: "PROBATION",
            gender: "MALE",
            maritalStatus: "SINGLE",
        });
        setModalMode("create");
        setErrors({});
        setIsFormOpen(true);
    };

    const handleEdit = async (employee) => {
        setLoading(true);
        try {
            const result = await employeesService.getById(employee.id);
            const fullData = result.data || {};
            setSelectedEmployee(fullData);
            setFormData(fullData);
            setModalMode("edit");
            setErrors({});
            setIsFormOpen(true);
        } catch (error) {
            toastError("Không thể lấy thông tin chi tiết nhân viên");
        } finally {
            setLoading(false);
        }
    };

    const handleViewDetail = async (employee) => {
        setLoading(true);
        try {
            const result = await employeesService.getById(employee.id);
            setSelectedEmployee(result.data || employee);
            setIsDetailOpen(true);
        } catch (error) {
            toastError("Không thể lấy thông tin chi tiết nhân viên");
        } finally {
            setLoading(false);
        }
    };

    const handleDelete = (employee) => {
        setSelectedEmployee(employee);
        setIsDeleteOpen(true);
    };

    const validateForm = () => {
        const rules = {
            employeeCode: [
                required("Mã nhân viên là bắt buộc"),
                regex(/^[A-Za-z0-9-]+$/, "Mã nhân viên chỉ được chứa chữ, số và dấu gạch ngang"),
                uniqueField(validationData, "employeeCode", selectedEmployee?.id, "Mã nhân viên đã tồn tại"),
            ],
            fullName: [
                required("Họ tên là bắt buộc"),
                regex(/^[a-zA-ZÀ-ỹ\s]+$/, "Họ tên chỉ được chứa chữ và khoảng trắng"),
            ],
            companyEmail: [
                required("Email công ty là bắt buộc"),
                email("Email không hợp lệ"),
                uniqueField(validationData, "companyEmail", selectedEmployee?.id, "Email công ty đã tồn tại"),
            ],
            personalEmail: [
                email("Email không hợp lệ"),
                uniqueField(validationData, "personalEmail", selectedEmployee?.id, "Email cá nhân đã tồn tại"),
            ],
            phoneNumber: [
                uniqueField(validationData, "phoneNumber", selectedEmployee?.id, "Số điện thoại đã tồn tại"),
            ],
            nationalId: [
                uniqueField(validationData, "nationalId", selectedEmployee?.id, "Số CCCD đã tồn tại"),
            ],
            departmentId: [required("Phòng ban là bắt buộc")],
            positionId: [required("Vị trí là bắt buộc")],
            jobGradeId: [required("Cấp bậc là bắt buộc")],
        };

        const validationErrors = validate(formData, rules);
        if (validationErrors) {
            setErrors(validationErrors);
            return false;
        }
        setErrors({});
        return true;
    };

    const handleFormSubmit = async () => {
        if (!validateForm()) {
            toastError("Vui lòng kiểm tra lại các trường thông tin bắt buộc");
            return;
        }
        setSubmitting(true);
        try {
            const data = new FormData();
            const excludeKeys = ['id', 'createdAt', 'updatedAt', 'deletedAt', 'isDeleted', 'user', 'department', 'position', 'jobGrade', 'directManager', 'hrMentor'];

            Object.keys(formData).forEach((key) => {
                if (excludeKeys.includes(key)) return;

                if (formData[key] !== undefined && formData[key] !== null) {
                    data.append(key, formData[key]);
                }
            });

            if (modalMode === "create") {
                await employeesService.create(data);
                success("Đã tạo nhân viên mới và gửi mail thông tin tài khoản");
            } else {
                await employeesService.update(selectedEmployee.id, data);
                success("Đã cập nhật thông tin nhân viên");
            }
            setIsFormOpen(false);
            fetchEmployees();
        } catch (error) {
            toastError(error.response?.data?.message || "Có lỗi xảy ra");
        } finally {
            setSubmitting(false);
        }
    };

    const confirmDelete = async () => {
        setSubmitting(true);
        try {
            await employeesService.delete(selectedEmployee.id);
            success("Đã xóa nhân viên");
            setIsDeleteOpen(false);
            fetchEmployees();
        } catch (error) {
            toastError("Không thể xóa nhân viên");
        } finally {
            setSubmitting(false);
        }
    };

    const handleExport = async () => {
        setExportLoading(true);
        try {
            const blob = await employeesService.exportExcel();
            const url = window.URL.createObjectURL(blob);
            const link = document.createElement("a");
            link.href = url;
            link.download = `employees_${new Date().toISOString().split("T")[0]}.xlsx`;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            window.URL.revokeObjectURL(url);
            success("Xuất dữ liệu thành công!");
        } catch (err) {
            toastError("Xuất dữ liệu thất bại");
        } finally {
            setExportLoading(false);
        }
    };

    return (
        <div className="space-y-6">
            <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                <PageTitle title="Quản lý Nhân viên" />
                <div className="flex items-center gap-3">
                    <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-500 text-white">
                        <Users className="h-5 w-5" />
                    </div>
                    <div>
                        <h1 className="text-2xl font-bold text-slate-900">Quản lý Nhân viên</h1>
                        <p className="text-sm text-slate-500">
                            Xem và quản lý hồ sơ nhân sự trong hệ thống
                        </p>
                    </div>
                </div>
                <div className="flex items-center gap-2">
                    <Button variant="outline" className="hidden sm:flex items-center gap-2" onClick={handleExport} loading={exportLoading}>
                        <Download className="h-4 w-4" /> Xuất Excel
                    </Button>
                    <Button onClick={handleCreate} className="flex items-center gap-2">
                        <Plus className="h-4 w-4" /> Thêm nhân viên
                    </Button>
                </div>
            </div>

            {/* Filters */}
            <div className="flex flex-wrap gap-4 p-4 bg-white rounded-lg border border-slate-200">
                <div className="w-48">
                    <Select
                        label="Phòng ban"
                        placeholder="-- Tất cả phòng ban --"
                        value={filters.departmentId}
                        onChange={(e) => setFilters({ ...filters, departmentId: e.target.value })}
                        options={
                            (metadata.departments || []).map(d => ({ value: d.id, label: d.departmentName }))
                        }
                    />
                </div>
                <div className="w-48">
                    <Select
                        label="Vị trí"
                        placeholder="-- Tất cả vị trí --"
                        value={filters.positionId}
                        onChange={(e) => setFilters({ ...filters, positionId: e.target.value })}
                        options={
                            (metadata.positions || []).map(p => ({ value: p.id, label: p.positionName }))
                        }
                    />
                </div>
                <div className="w-48">
                    <Select
                        label="Trạng thái"
                        placeholder="-- Tất cả trạng thái --"
                        value={filters.employmentStatus}
                        onChange={(e) => setFilters({ ...filters, employmentStatus: e.target.value })}
                        options={
                            (metadata.employmentStatusOptions || [])
                        }
                    />
                </div>
            </div>

            <EmployeeTable
                data={employees}
                loading={loading}
                search={search}
                onSearchChange={setSearch}
                pagination={pagination}
                onPaginationChange={setPagination}
                totalPages={totalPages}
                onEdit={handleEdit}
                onDelete={handleDelete}
                onViewDetail={handleViewDetail}
            />

            <EmployeeFormModal
                isOpen={isFormOpen}
                onClose={() => setIsFormOpen(false)}
                onSubmit={handleFormSubmit}
                formData={formData}
                onFormChange={setFormData}
                metadata={metadata}
                loading={submitting}
                errors={errors}
                mode={modalMode}
            />

            <EmployeeDeleteModal
                isOpen={isDeleteOpen}
                onClose={() => setIsDeleteOpen(false)}
                onConfirm={confirmDelete}
                employee={selectedEmployee}
                loading={submitting}
            />

            <EmployeeDetailModal
                isOpen={isDetailOpen}
                onClose={() => setIsDetailOpen(false)}
                employee={selectedEmployee}
            />
        </div>
    );
}là 1 senior developer, hãy dựa vào cấu trúc dự án này tôi muốn làm thêm các chức năng (không được sửa entity nhé)
Generate Monthly TimesheetUC24 - Monthly Timesheet GenerationAdd Employee To TimesheetRemove Employee From TimesheetView Monthly TimesheetView Employee Attendance DetailsUC25 - Timesheet Data ManagementRecalculate TimesheetEdit Timesheet DataExport Timesheet SummaryExport Detailed AttendanceUC26 - Timesheet LockingLock Timesheet, Confirm the payroll and request.

import { Entity, Column, OneToOne, JoinColumn, ManyToOne } from 'typeorm';
import { BaseEntity } from '../../common/entities/base.entity.js';
import { UserEntity } from './user.entity.js';
import { DepartmentEntity } from './department.entity.js';
import { PositionEntity } from './position.entity.js';
import { JobGradeEntity } from './job-grade.entity.js';
import { OnboardingPlanEntity } from './onboarding-plan.entity.js';

@Entity('employees')
export class EmployeeEntity extends BaseEntity {
    @Column({ name: 'employee_code', unique: true, type: 'varchar', length: 20, nullable: true })
    employeeCode;

    @Column({ name: 'user_id', nullable: true, type: 'int' })
    userId;

    @OneToOne(() => UserEntity)
    @JoinColumn({ name: 'user_id' })
    user;

    @Column({ name: 'national_id', nullable: true, type: 'varchar' })
    nationalId;

    @Column({ name: 'national_id_issued_date', type: 'date', nullable: true })
    nationalIdIssuedDate;

    @Column({ name: 'national_id_issued_place', nullable: true, type: 'varchar' })
    nationalIdIssuedPlace;

    @Column({ name: 'full_name', type: 'varchar' })
    fullName;

    @Column({ name: 'date_of_birth', type: 'date', nullable: true })
    dateOfBirth;

    @Column({ nullable: true, type: 'varchar' })
    gender;

    @Column({ name: 'marital_status', nullable: true, type: 'varchar' })
    maritalStatus;

    @Column({ nullable: true, type: 'varchar' })
    nationality;

    @Column({ name: 'tax_code', nullable: true, type: 'varchar' })
    taxCode;

    @Column({ name: 'personal_email', nullable: true, type: 'varchar' })
    personalEmail;

    @Column({ name: 'company_email', nullable: true, type: 'varchar' })
    companyEmail;

    @Column({ name: 'phone_number', nullable: true, type: 'varchar' })
    phoneNumber;

    @Column({ name: 'education_level', nullable: true, type: 'varchar' })
    educationLevel;

    @Column({ name: 'permanent_address', nullable: true, type: 'varchar' })
    permanentAddress;

    @Column({ name: 'current_address', nullable: true, type: 'varchar' })
    currentAddress;

    @Column({ name: 'department_id', nullable: true, type: 'int' })
    departmentId;

    @ManyToOne(() => DepartmentEntity)
    @JoinColumn({ name: 'department_id' })
    department;

    @Column({ name: 'position_id', nullable: true, type: 'int' })
    positionId;

    @ManyToOne(() => PositionEntity)
    @JoinColumn({ name: 'position_id' })
    position;

    @Column({ name: 'plan_id', nullable: true, type: 'int' })
    planId;

    @ManyToOne(() => OnboardingPlanEntity)
    @JoinColumn({ name: 'plan_id' })
    plan;

    @Column({ name: 'direct_manager_id', nullable: true, type: 'int' })
    directManagerId;

    @ManyToOne(() => EmployeeEntity)
    @JoinColumn({ name: 'direct_manager_id' })
    directManager;

    @Column({ name: 'job_grade_id', nullable: true, type: 'int' })
    jobGradeId;

    @ManyToOne(() => JobGradeEntity)
    @JoinColumn({ name: 'job_grade_id' })
    jobGrade;

    @Column({ name: 'hr_mentor_id', nullable: true, type: 'int' })
    hrMentorId;

    @ManyToOne(() => EmployeeEntity)
    @JoinColumn({ name: 'hr_mentor_id' })
    hrMentor;

    @Column({ name: 'join_date', type: 'date', nullable: true })
    joinDate;

    @Column({ name: 'official_start_date', type: 'date', nullable: true })
    officialStartDate;

    @Column({ name: 'employment_status', nullable: true, type: 'varchar' })
    employmentStatus;

    @Column({ name: 'front_id_card_file_path', nullable: true, type: 'varchar' })
    frontIdCardFilePath;

    @Column({ name: 'back_id_card_file_path', nullable: true, type: 'varchar' })
    backIdCardFilePath;

    @Column({ nullable: true, type: 'varchar' })
    avatar;
}
import { Entity, Column, ManyToOne, JoinColumn } from 'typeorm';
import { BaseEntity } from '../../common/entities/base.entity.js';
import { ShiftGroupEntity } from './shift-group.entity.js';

@Entity('working_shifts')
export class WorkingShiftEntity extends BaseEntity {
    @Column({ name: 'shift_name', type: 'varchar' })
    shiftName;

    @Column({ name: 'start_time', type: 'time', nullable: true })
    startTime;

    @Column({ name: 'end_time', type: 'time', nullable: true })
    endTime;

    @Column({ name: 'break_start_time', type: 'time', nullable: true })
    breakStartTime;

    @Column({ name: 'break_end_time', type: 'time', nullable: true })
    breakEndTime;

    @Column({ name: 'group_id', type: 'int', nullable: true })
    groupId;

    @ManyToOne(() => ShiftGroupEntity, group => group.shifts)
    @JoinColumn({ name: 'group_id' })
    group;
}
import { Entity, Column, ManyToOne, JoinColumn } from 'typeorm';
import { BaseEntity } from '../../common/entities/base.entity.js';
import { EmployeeEntity } from './employee.entity.js';

@Entity('time_sheets')
export class TimeSheetEntity extends BaseEntity {
    @Column({ name: 'employee_id', type: 'int' })
    employeeId;

    @Column({ type: 'int' })
    month;

    @Column({ type: 'int' })
    year;

    @Column({ name: 'total_working_days', nullable: true, type: 'decimal', precision: 5, scale: 2 })
    totalWorkingDays;

    @Column({ name: 'total_working_hours', type: 'decimal', precision: 10, scale: 2, nullable: true })
    totalWorkingHours;

    @Column({ name: 'overtime_hours', type: 'decimal', precision: 10, scale: 2, nullable: true })
    overtimeHours;

    @Column({ name: 'is_locked', default: false, type: 'boolean' })
    isLocked;

    @ManyToOne(() => EmployeeEntity)
    @JoinColumn({ name: 'employee_id' })
    employee;
}
import { Entity, Column, ManyToOne, JoinColumn } from 'typeorm';
import { BaseEntity } from '../../common/entities/base.entity.js';
import { EmployeeEntity } from './employee.entity.js';
import { WorkingShiftEntity } from './working-shift.entity.js';

@Entity('shift_assignments')
export class ShiftAssignmentEntity extends BaseEntity {
    @Column({ name: 'employee_id', type: 'int' })
    employeeId;

    @Column({ name: 'shift_id', type: 'int' })
    shiftId;

    @Column({ name: 'effective_from', type: 'date', nullable: true })
    effectiveFrom;

    @Column({ name: 'effective_to', type: 'date', nullable: true })
    effectiveTo;

    @ManyToOne(() => EmployeeEntity)
    @JoinColumn({ name: 'employee_id' })
    employee;

    @ManyToOne(() => WorkingShiftEntity)
    @JoinColumn({ name: 'shift_id' })
    shift;
}
import { Entity, Column, OneToMany } from 'typeorm';
import { BaseEntity } from '../../common/entities/base.entity.js';
import { WorkingShiftEntity } from './working-shift.entity.js';

@Entity('shift_groups')
export class ShiftGroupEntity extends BaseEntity {
    @Column({ name: 'group_name', type: 'varchar' })
    groupName;

    @Column({ name: 'description', type: 'varchar', nullable: true })
    description;

    @OneToMany(() => WorkingShiftEntity, shift => shift.group)
    shifts;
}
import {
    Entity,
    Column,
    OneToMany,
    BeforeInsert,
    BeforeUpdate,
} from 'typeorm';
import { Exclude } from 'class-transformer';
import { BaseEntity } from '../../common/entities/base.entity.js';
import { UserRoleEntity } from './user-role.entity.js';

@Entity('users')
export class UserEntity extends BaseEntity {
    @Column({ unique: true, type: 'varchar' })
    username;

    @Column({ select: false, type: 'varchar' })
    @Exclude()
    password;

    @Column({ unique: true, type: 'varchar' })
    email;

    @Column({ default: 'ACTIVE', type: 'varchar' })
    status; // ACTIVE, LOCKED, DELETED

    @Column({ name: 'last_login_time', nullable: true, type: 'datetime' })
    lastLoginTime;

    @Column({ name: 'refresh_token', nullable: true, type: 'varchar' })
    @Exclude()
    refreshToken;

    @Column({ name: 'refresh_token_expire_at', nullable: true, type: 'datetime' })
    refreshTokenExpireAt;

    @OneToMany(() => UserRoleEntity, (userRole) => userRole.user)
    userRoles;

    @BeforeInsert()
    @BeforeUpdate()
    emailToLowerCase() {
        this.email = this.email?.toLowerCase();
    }
}
import { Router } from 'express';
import { EmployeesController } from '../controllers/employees.controller.js';
import { EmployeesService } from '../services/employees.service.js';
import { EmployeesRepository } from '../repositories/employees.repository.js';
import { authMiddleware } from '../common/middleware/auth.middleware.js';
import { permissionsMiddleware } from '../common/middleware/permissions.middleware.js';
import { upload } from '../common/middleware/upload.middleware.js';

const router = Router();

// Dependency Injection
const employeesRepository = new EmployeesRepository();
const employeesService = new EmployeesService(employeesRepository);
const employeesController = new EmployeesController(employeesService);

/**
 * @swagger
 * tags:
 *   name: Employees
 *   description: Employee management endpoints
 */

// View permissions
router.get('/meta-data', authMiddleware, permissionsMiddleware('EMPLOYEE_READ'), employeesController.getMetadata);
router.get('/list', authMiddleware, employeesController.list);
router.get('/no-plan', authMiddleware, permissionsMiddleware('EMPLOYEE_READ'), employeesController.getEmployeeNoPlanId);
router.get('/user/:userId', authMiddleware, employeesController.getByUserId);
router.get('/', authMiddleware, permissionsMiddleware('EMPLOYEE_READ'), employeesController.all);
router.get('/validation-data', authMiddleware, permissionsMiddleware('EMPLOYEE_READ'), employeesController.getValidationData);
router.get('/:id', authMiddleware, permissionsMiddleware('EMPLOYEE_READ'), employeesController.findOne);

// Export permission
router.get('/export', authMiddleware, permissionsMiddleware('EMPLOYEE_EXPORT'), employeesController.export);

// Create permission
router.post('/', authMiddleware, permissionsMiddleware('EMPLOYEE_CREATE'), upload.fields([
    { name: 'frontIdCard', maxCount: 1 },
    { name: 'backIdCard', maxCount: 1 }
]), employeesController.create);

// Update permission
router.put('/:id', authMiddleware, permissionsMiddleware('EMPLOYEE_UPDATE'), upload.fields([
    { name: 'frontIdCard', maxCount: 1 },
    { name: 'backIdCard', maxCount: 1 }
]), employeesController.update);

// Delete permission
router.delete('/:id', authMiddleware, permissionsMiddleware('EMPLOYEE_DELETE'), employeesController.delete);

export const employeesRoutes = router;
export const metadata = {
    title: "Quản lý nhân viên",
};

export default function EmployeesLayout({ children }) {
    return children;
}
"use client";

import { Modal } from "@/components/common/Modal";
import { Button } from "@/components/common/Button";
import { AlertCircle } from "lucide-react";

export default function EmployeeDeleteModal({ isOpen, onClose, onConfirm, employee, loading }) {
    return (
        <Modal isOpen={isOpen} onClose={onClose} title="Xác nhận xóa">
            <div className="space-y-6">
                <div className="flex items-center gap-4 text-rose-600 bg-rose-50 p-4 rounded-lg border border-rose-100">
                    <AlertCircle className="h-6 w-6 flex-shrink-0" />
                    <p className="text-sm font-medium">
                        Hành động này không thể hoàn tác. Mọi dữ liệu liên quan đến nhân viên này sẽ bị xóa khỏi hệ thống.
                    </p>
                </div>

                <div className="space-y-2">
                    <p className="text-slate-600">
                        Bạn có chắc chắn muốn xóa nhân viên:
                    </p>
                    <p className="text-lg font-bold text-slate-900 border-l-4 border-slate-200 pl-4 py-1">
                        {employee?.fullName}
                    </p>
                </div>

                <div className="flex justify-end gap-3 pt-4">
                    <Button variant="outline" onClick={onClose} disabled={loading}>
                        Hủy
                    </Button>
                    <Button
                        variant="destructive"
                        onClick={onConfirm}
                        loading={loading}
                        className="bg-rose-600 hover:bg-rose-700"
                    >
                        Xác nhận xóa
                    </Button>
                </div>
            </div>
        </Modal>
    );
}
import api from "@/lib/api";

export const employeesService = {
    getAll: async (params = {}) => {
        const response = await api.get("/employees", { params });
        return response.data;
    },

    getList: async () => {
        const response = await api.get("/employees/list");
        return response.data;
    },

    getMetadata: async () => {
        const response = await api.get("/employees/meta-data");
        return response.data;
    },

    getById: async (id) => {
        const response = await api.get(`/employees/${id}`);
        return response.data;
    },

    create: async (data) => {
        const response = await api.post("/employees", data);
        return response.data;
    },

    update: async (id, data) => {
        const response = await api.put(`/employees/${id}`, data);
        return response.data;
    },

    delete: async (id) => {
        const response = await api.delete(`/employees/${id}`);
        return response.data;
    },

    getValidationData: async () => {
        const response = await api.get("/employees/validation-data");
        return response.data;
    },

    exportExcel: async () => {
        const response = await api.get("/employees/export", {
            responseType: "blob",
        });
        return response.data;
    },

    getEmployeeNoPlanId: async () => {
        const response = await api.get("/employees/no-plan");
        return response.data;
    },
};