
const createNewCrewMember = (name) => {
    const crewMemberName = name
    const crewMember = {
        name: crewMemberName,
        trained: false
    }
    return crewMember
}

export default createNewCrewMember