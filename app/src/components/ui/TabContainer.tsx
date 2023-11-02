'use client';
import { classNames } from '../../utils/classNames';
import { useTabs } from '../../hooks/useTabs';

export const TabContainer = () => {
  const tabs = useTabs();
  return (
    <div className="block">
      <div className="border-b border-gray-200">
        <nav className="-mb-px flex" aria-label="Tabs">
          {tabs.map((tab) => (
            <a
              key={tab.name}
              href={tab.href}
              className={classNames(
                tab.active
                  ? 'border-indigo-500 text-indigo-500'
                  : 'border-transparent text-gray-400 hover:text-gray-500 hover:border-gray-500 transition-colors',
                'w-1/4 py-4 px-1 text-center border-b-2 font-medium text-sm'
              )}
              aria-current={tab.active ? 'page' : undefined}
            >
              {tab.name}
            </a>
          ))}
        </nav>
      </div>
    </div>
  );
};
