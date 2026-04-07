import 'package:flutter/material.dart';

void main() {
  runApp(const WaterPollutionPresentationApp());
}

class WaterPollutionPresentationApp extends StatelessWidget {
  const WaterPollutionPresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Pollution Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue.shade800,
          secondary: Colors.teal.shade600,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PresentationScreen(),
      },
    );
  }
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 12;

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.white,
              Colors.cyan.shade50,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progress Bar
              LinearProgressIndicator(
                value: (_currentPage + 1) / _totalPages,
                backgroundColor: Colors.grey.shade200,
                color: Theme.of(context).colorScheme.primary,
                minHeight: 6,
              ),
              
              // Slide Content
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.blue.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: [
                            _buildTitleSlide(),
                            _buildSlide(
                              title: '2. Introduction to Water Pollution',
                              icon: Icons.water_drop,
                              content: [
                                'Water pollution is the contamination of water bodies (e.g., lakes, rivers, oceans, aquifers, and groundwater).',
                                'It occurs when pollutants are directly or indirectly discharged into water bodies without adequate treatment.',
                                'Clean water is essential for all living organisms and ecological balance.',
                                'It is one of the most critical environmental challenges of the 21st century, threatening human health and biodiversity.',
                              ],
                            ),
                            _buildSlide(
                              title: '3. Sources of Water Pollution',
                              icon: Icons.factory,
                              content: [
                                'Point Source Pollution: Contamination that enters a water body from a single, identifiable source, such as a pipe or ditch (e.g., industrial discharge, sewage treatment plants).',
                                'Non-Point Source Pollution: Diffuse contamination that does not originate from a single discrete source. It is often the cumulative effect of small amounts of contaminants gathered from a large area (e.g., agricultural runoff, urban stormwater).',
                                'Natural Sources: Volcanic eruptions, algae blooms, storms, and earthquakes can also cause major changes in water quality.',
                              ],
                            ),
                            _buildSlide(
                              title: '4. Types of Water Pollutants',
                              icon: Icons.science,
                              content: [
                                'Biological Pollutants: Pathogens such as bacteria, viruses, and protozoa from sewage and animal waste.',
                                'Chemical Pollutants: Heavy metals (lead, mercury), pesticides, herbicides, industrial solvents, and petroleum products.',
                                'Physical Pollutants: Suspended solids, microplastics, and thermal pollution (abnormal temperature changes from industrial cooling).',
                                'Nutrient Pollution: Excess nitrogen and phosphorus from fertilizers leading to eutrophication.',
                              ],
                            ),
                            _buildSlide(
                              title: '5. Effects on Human Health',
                              icon: Icons.health_and_safety,
                              content: [
                                'Waterborne Diseases: Consumption of contaminated water leads to diseases like cholera, typhoid, dysentery, and hepatitis.',
                                'Toxic Accumulation: Heavy metals and chemicals can accumulate in the human body, causing neurological damage, cancer, and reproductive issues.',
                                'Infant Mortality: Poor water quality is a leading cause of infant mortality in developing nations due to diarrheal diseases.',
                                'Food Chain Contamination: Humans consume toxins by eating fish and aquatic life that have ingested pollutants.',
                              ],
                            ),
                            _buildSlide(
                              title: '6. Effects on Environment & Aquatic Life',
                              icon: Icons.set_meal,
                              content: [
                                'Eutrophication: Excess nutrients cause algal blooms, which block sunlight and deplete oxygen when they decompose.',
                                'Hypoxia (Dead Zones): Severe oxygen depletion in water bodies makes it impossible for marine life to survive.',
                                'Habitat Destruction: Acid rain and chemical spills destroy fragile ecosystems like coral reefs and wetlands.',
                                'Disruption of Food Chains: Pollutants like microplastics and heavy metals are ingested by small organisms and magnify as they move up the food chain.',
                              ],
                            ),
                            _buildSlide(
                              title: '7. Groundwater Contamination',
                              icon: Icons.layers,
                              content: [
                                'Groundwater is a vital source of drinking water and irrigation, but it is highly vulnerable to hidden pollution.',
                                'Causes: Leaching of agricultural chemicals (pesticides/fertilizers), leaking underground storage tanks, and improper landfill design.',
                                'Long-term Impact: Once contaminated, groundwater is extremely difficult and expensive to clean up because of its slow movement and lack of sunlight/oxygen for natural degradation.',
                                'Saltwater Intrusion: Over-extraction of groundwater in coastal areas can draw seawater into freshwater aquifers.',
                              ],
                            ),
                            _buildSlide(
                              title: '8. Water Pollution in India',
                              icon: Icons.map,
                              content: [
                                'River Pollution: Major rivers like the Ganga and Yamuna face severe pollution from untreated sewage, industrial effluents, and religious offerings.',
                                'Untreated Sewage: A significant percentage of urban sewage in India is discharged directly into water bodies without treatment.',
                                'Industrial Hotspots: Dyeing, tanning, and pharmaceutical industries contribute heavily to chemical pollution in specific regions.',
                                'Government Initiatives: Programs like Namami Gange and the National River Conservation Plan aim to clean and rejuvenate major water bodies.',
                              ],
                            ),
                            _buildSlide(
                              title: '9. Role of Civil Engineering',
                              icon: Icons.engineering,
                              content: [
                                'As Civil Engineers, we play a crucial role in managing and mitigating water pollution.',
                                'Wastewater Treatment: Designing, constructing, and maintaining efficient Sewage Treatment Plants (STPs) and Effluent Treatment Plants (ETPs).',
                                'Drainage Systems: Developing sustainable urban drainage systems (SUDS) to manage stormwater runoff and prevent urban flooding and pollution.',
                                'Water Supply Engineering: Ensuring safe distribution networks that prevent cross-contamination between sewage and drinking water lines.',
                                'Sanitary Landfills: Designing secure landfills with proper liners to prevent leachate from contaminating groundwater.',
                              ],
                            ),
                            _buildSlide(
                              title: '10. Prevention and Control Measures',
                              icon: Icons.shield,
                              content: [
                                'Strict Legislation: Enforcing environmental laws and penalizing industries that violate discharge standards.',
                                'Sustainable Agriculture: Promoting organic farming and optimizing the use of fertilizers and pesticides.',
                                'Public Awareness: Educating communities about proper waste disposal, reducing plastic use, and water conservation.',
                                'Green Infrastructure: Using natural systems like constructed wetlands and rain gardens to filter pollutants from runoff.',
                              ],
                            ),
                            _buildSlide(
                              title: '11. Water Treatment Technologies',
                              icon: Icons.water,
                              content: [
                                'Primary Treatment: Physical processes like screening and sedimentation to remove large solids.',
                                'Secondary Treatment: Biological processes (e.g., activated sludge) where microorganisms consume organic matter.',
                                'Tertiary Treatment: Advanced chemical and physical processes to remove specific pollutants like nitrogen, phosphorus, and heavy metals.',
                                'Modern Tech: Reverse Osmosis (RO), UV disinfection, and membrane bioreactors are increasingly used for high-quality water recovery.',
                              ],
                            ),
                            _buildConclusionSlide(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Bottom Navigation Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, -4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _currentPage > 0 ? _previousPage : null,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Previous'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                    Text(
                      'Slide ${_currentPage + 1} of $_totalPages',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _currentPage < _totalPages - 1 ? _nextPage : null,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSlide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.account_balance, size: 64, color: Colors.blue),
            const SizedBox(height: 24),
            Text(
              'GOVERNMENT POLYTECHNIC BUXAR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.blue.shade900,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'DEPARTMENT OF CIVIL ENGINEERING',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.teal.shade700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade200, width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    'PRESENTATION ON',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'WATER POLLUTION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildInfoCard(
                    title: 'Presented By',
                    icon: Icons.person,
                    details: [
                      'Gaurav Kumar',
                      'Roll no: 609/civil/24',
                      'Semester: 6th Semester',
                      'Session: 2024-2026',
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildInfoCard(
                    title: 'Guidance & Supervision',
                    icon: Icons.school,
                    details: [
                      'Under Guidance:',
                      'Mr. Anwesh Chandra',
                      '',
                      'Head of Department:',
                      'Mr. Dipu kumari',
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Academic Year 2026',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required IconData icon, required List<String> details}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue.shade700, size: 24),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          ...details.map((detail) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                  detail,
                  style: TextStyle(
                    fontSize: 16,
                    color: detail.contains(':') || detail.startsWith('Mr.') ? Colors.black87 : Colors.black54,
                    fontWeight: detail.contains(':') || detail.startsWith('Mr.') ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSlide({required String title, required IconData icon, required List<String> content}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 40, color: Colors.blue.shade800),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(thickness: 2),
            const SizedBox(height: 32),
            ...content.map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade500,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(
                            fontSize: 22,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildConclusionSlide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Icon(Icons.eco, size: 80, color: Colors.green.shade600),
            const SizedBox(height: 24),
            Text(
              '12. Conclusion',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: const Text(
                'Water pollution is a severe threat to our planet\'s survival. As future Civil Engineers, we hold the responsibility to design sustainable infrastructure, implement effective wastewater treatment systems, and advocate for environmental protection. Clean water is not just a resource; it is a fundamental right for all living beings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  height: 1.6,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Text(
              'THANK YOU',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Colors.blue.shade800,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Any Questions?',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
